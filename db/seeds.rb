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
    subject: 'Chúc mừng bạn đã nhânj được bản thần số học rút gọn',
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
  }]


email_templates_attributes.each do |email_template_attributes|
  EmailTemplate.create!(email_template_attributes)
end

puts "Init #{EmailTemplate.count} email templates data => done"


numerologies_attributes = [
  {
    name: 'vo tan phu', email: 'votanphu.2101@gmail.com', day_of_birth: "21/01/1992", phone: "0705736679", user_id: user.id
  },
  {
    name: 'ho nhat thai', email: 'honhatthai19694@gmail.com', day_of_birth: "19/06/1994", phone: "0705736679", user_id: user.id
  }

]

numerologies_attributes.each do |numerologie_attributes|
  numerology = Numerology.new(numerologie_attributes)
  # user.skip_confirmation!
  numerology.save! if Numerology.where(email: numerologie_attributes[:email]).first.blank?
end


puts "Init #{Numerology.count} Numerologies data => done"
