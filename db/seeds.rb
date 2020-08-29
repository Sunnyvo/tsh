# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users_attributes = [
{
  email: 'tsh@gmail.com', password: '101010', password_confirmation: '101010'
},

{
  email: 'votanphu.2101@gmail.com', password: '101010', password_confirmation: '101010'
}
]

users_attributes.each do |user_attributes|
  user = User.new(user_attributes)
  # user.skip_confirmation!
  user.save! if User.where(email: user_attributes[:email]).first.blank?

end
puts "Init #{users_attributes.count} users data => done"


user = User.where(email: 'votanphu.2101@gmail.com').first

# Init email_templates data
email_templates_attributes = [
  {
    name: 'Đăng ký nhận bản rút gọn ',
    subject: 'Chúc mừng bạn đã nhận được bản thần số học rút gọn',
    plain_content: "
      Xin chào {{customer_first_name}},\n\r\n\r
      Bạn đã nhận được một quà tặng vô cùng ý nghĩa có thể giúp bạn có những bước đi đỡ vất vả hơn trong cuộc sống.
      Thanks,\n\r
      Thần số học - Giải mã cuộc đời\n\r
    ",
    html_content: "
    Xin chào {{customer_first_name}},\n\r\n\r
    Bạn đã nhận được một quà tặng vô cùng ý nghĩa có thể giúp bạn có những bước đi đỡ vất vả hơn trong cuộc sống.
    Thanks,\n\r
    Thần số học - Giải mã cuộc đời\n\r
    ",
    category: 'SEND_DEMO',
    active: true,
    user_id: user[:id]
  },
  {
    name: 'Đăng ký nhận bản đầy đủ ',
    subject: 'Chúc mừng bạn đã nhận được bản thần số học đầy đủ',
    plain_content: "
      Xin chào {{customer_first_name}},\n\r\n\r
      Bạn đã nhận được một quà tặng vô cùng ý nghĩa có thể giúp bạn có những bước đi đỡ vất vả hơn trong cuộc sống.
      Thanks,\n\r
      Thần số học - Giải mã cuộc đời\n\r
    ",
    html_content: "
    Xin chào {{customer_first_name}},\n\r\n\r
    Bạn đã nhận được một quà tặng vô cùng ý nghĩa có thể giúp bạn có những bước đi đỡ vất vả hơn trong cuộc sống.
    Thanks,\n\r
    Thần số học - Giải mã cuộc đời\n\r
    ",
    category: 'SEND_FULL',
    active: true,
    user_id: user[:id]
  },
  {
    name: 'Đăng ký tham gia khoa hoc doc vi bat ky ai qua nhan so hoc',
    subject: 'Chúc Mừng Bạn Đã Đăng Ký Thành Công Khóa Học Đoc Vị Bất Kỳ Ai Qua Nhân Số Học ',
    plain_content: "
      Xin chào {{customer_first_name}},\n\r\n\r
      Buổi đào tạo học trực tuyến sẽ được tổ chức qua zoom.
      Thời gian học vào lúc 19h15 tối các ngày: 16/9, 17/9, 19/9 và 21/9
      Mọi người hãy tải trước ứng dụng zoom để tham gia các buổi học, link hướng dẫn:
      https://www.youtube.com/watch?v=Zzuy4cGuUV4
      Link tham gia lớp học:
      https://zalo.me/g/wyfxkb210

      Thanks,\n\r
      Thần số học - Giải mã cuộc đời\n\r
    ",
    html_content: "
    Xin chào {{customer_first_name}},\n\r\n\r
      Buổi đào tạo học trực tuyến sẽ được tổ chức qua zoom.
      Thời gian học vào lúc 19h15 tối các ngày: 16/9, 17/9, 19/9 và 21/9
      Mọi người hãy tải trước ứng dụng zoom để tham gia các buổi học, link hướng dẫn:
      https://www.youtube.com/watch?v=Zzuy4cGuUV4
      Link tham gia nhóm học tập trên zalo:
      https://zalo.me/g/wyfxkb210

      Thanks,\n\r
      Thần số học - Giải mã cuộc đời\n\r
    ",
    category: 'SEND_DOCVI',
    active: true,
    user_id: user[:id]
  }
]

if EmailTemplate.count == 0
  email_templates_attributes.each do |email_template_attributes|
    email_template = EmailTemplate.new(email_template_attributes)
  email_template.save! if EmailTemplate.where(category: email_template_attributes[:category]).first.blank?
  end

end

puts "Init #{EmailTemplate.count} email templates data => done"


numerologies_attributes = [
  {
    name: 'vo tan phu', email: 'votanphu.2101@gmail.com', day_of_birth: "21/01/1992", phone: "0705736679", user_id: user.id, name2: "pham chinh hien", day_of_birth2: "05/08/2001"
  },
  {
    name: 'ho nhat thai', email: 'honhatthai19694@gmail.com', day_of_birth: "19/06/1994", phone: "0705736679", user_id: user.id
  }

]

if Numerology.count == 0
  numerologies_attributes.each do |numerologie_attributes|
    numerology = Numerology.new(numerologie_attributes)
    # user.skip_confirmation!
    numerology.save! if Numerology.where(email: numerologie_attributes[:email]).first.blank?
  end

end

puts "Init #{Numerology.count} Numerologies data => done"
