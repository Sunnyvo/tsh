class UserMailer < ApplicationMailer
  def send_demo(options = {})
    numerology = Numerology.find_by_id(options[:id])
    @customer_email = numerology.email
    @customer_first_name = numerology.name
    # Get email template
    email_template = EmailTemplate.send_demo
    return if email_template.blank?
    email_template.html_content.gsub! '{{customer_first_name}}', @customer_first_name
    numerology.attach_pdf_demo
    attachments['tsh_rutgon.pdf'] = File.read("#{Rails.root}/app/data/demo.pdf")

      mixed = mail(to: @customer_email,
      subject: email_template.subject,
      body: email_template.html_content,
      content_type: 'text/html',
      template_path: 'admin',
      template_name: 'send_demo_tsh')

    # Set the message content-type to be 'multipart/mixed'
    mixed.content_type 'multipart/mixed'
    mixed.header['content-type'].parameters[:boundary] = mixed.body.boundary

    # # Set Content-Disposition to nil to remove it - fixes iOS attachment viewing
    mixed.content_disposition = nil

  end

  def send_full(options = {})
    numerology = Numerology.find_by_id(options[:id])
    @customer_email = numerology.email
    @customer_first_name = numerology.name
    # Get email template
    email_template = EmailTemplate.send_full
    return if email_template.blank?
    email_template.html_content.gsub! '{{customer_first_name}}', @customer_first_name
    numerology.attach_pdf_full
    attachments["tsh_#{numerology.name.split(" ").join("_")}.pdf"] = File.read("#{Rails.root}/app/data/full.pdf")

      mixed = mail(to: @customer_email,
      subject: email_template.subject,
      body: email_template.html_content,
      content_type: 'text/html',
      template_path: 'admin',
      template_name: 'send_full_tsh')

    # Set the message content-type to be 'multipart/mixed'
    mixed.content_type 'multipart/mixed'
    mixed.header['content-type'].parameters[:boundary] = mixed.body.boundary

    # # Set Content-Disposition to nil to remove it - fixes iOS attachment viewing
    mixed.content_disposition = nil

  end
end

