class UserMailer < ApplicationMailer
  def send_demo(options = {})
    p "hello:"
    puts options
    # @customer_email = options[:email].to_s
    # @customer_name = options[:name].to_s
    @customer_email = "votanphu.2101@gmail.com"
    @customer_first_name = "Võ Tấn Phú"
    numerology = Numerology.find_by_id(options[:id])
    # Get email template
    email_template = EmailTemplate.send_demo
    return if email_template.blank?
    email_template.html_content.gsub! '{{customer_first_name}}', @customer_first_name
    # if numerology.image.attached?
    # numerology.testpdf
      # attachments['tsh_rutgon.pdf'] = numerology.demo.download
    # end
    attachments['tsh_rutgon.pdf'] = File.read("#{Rails.root}/app/data/out.pdf")
    # attachments['tsh_rutgon.pdf'] = numerology.testpdf.to_pdf
      # encoded_content = File.read("#{Rails.root}/app/data/out.pdf")
    # attachments['tsh_rutgon.pdf'] = {:mime_type => 'application/x-gzip',
      # :encoding => 'SpecialEncoding',
      # :content => encoded_content }

      mixed = mail(to: @customer_email,
      subject: "Bạn đã đăng ký thành công",
      body: email_template.html_content,
      content_type: 'text/html',
      # name: 'text/html',
      template_path: 'admin',
      template_name: 'send_demo_tsh')
    # mixed = mail( to: @customer_email.email,
    #   subject: "Bạn đã đăng ký thành công bài demo rút gọn") do |format|
    #   format.text
    #   format.html

    # Set the message content-type to be 'multipart/mixed'
    mixed.content_type 'multipart/mixed'
    mixed.header['content-type'].parameters[:boundary] = mixed.body.boundary

    # # Set Content-Disposition to nil to remove it - fixes iOS attachment viewing
    mixed.content_disposition = nil

  end
end

