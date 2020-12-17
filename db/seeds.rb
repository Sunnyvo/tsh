# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users_attributes = [
{
  email: 'info@miranum.com', password: 'Miracle!@#123', password_confirmation: 'Miracle!@#123'
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

if EmailTemplate.count != 0
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

numcontents_attributes = [
  # day of birth
  {
    number: "1",
    content: "Bạn thể hiện năng lực của người lãnh đạo.  <br>
    Bạn có khả năng tập trung cao, trí thông minh, sự sáng tạo  và khả năng hành động, ra quyết định dứt khoát.",
    advise:  "Bạn luôn là người độc lập, mạnh mẽ, điều đó rất hữu ích để bạn mạnh dạn hướng tới vị trí của một nhà lãnh đạo tài ba.  <br> Nhưng khi ở trang thái tiêu cực hãy biết lắng nghe và đồng cảm nhiều hơn.",
    category: "DB_NUM",
    active: true
  },
  {
    number: "2",
    content: "Bạn là người tình cảm chân thành coi trọng mối quan hệ. Biểu hiện ra ngoài rất nhẹ nhàng tình cảm, dễ mến  <br>
    Bạn nhạy cảm và có trực giác tốt, bởi sở hữu con số của cảm xúc nên thường có năng khiếu về văn, thơ ca nghệ thuật, vẽ, có tính nghệ sĩ.",
    advise: "Số 2 nên cải thiện sự rụt rè, bởi cảm giác sợ rủi ro nên khả năng ra quyết định của bạn sẽ không dứt khoát, có thể sẽ mất những cơ hội đáng tiếc.",
    category: "DB_NUM",
    active: true
  },
  {
    number: "3",
    content: "Bạn sở hữu năng lực truyền đạt bằng ngôn từ.  Là người hoạt ngôn, và sử dụng ngôn từ sắc bén. Vì vậy bạn thường là người quảng giao, nhiều bạn bè.  <br>
    Bạn vô cùng sáng tạo và luôn có nhiều ý tưởng.",
    advise: "",
    category: "DB_NUM",
    active: true
  },
  {
    number: "4",
    content: "Bạn thể hiện ra ngoài là một người sự mộc mạc, chân thật và trách  <br>
    Bạn có năng lực phân tích, tổ chức quản trị giỏi.  <br>
    Bạn rất kỉ luật trong công việc, bạn có năng lực phân tích, tổ chức quản trị giỏi.",
    advise: "Kiên trì theo đuổi 1 công việc, bạn sẽ có thành tựu tốt với chuyên môn cao. Bạn hãy chú ý thêm đến phần ngôn từ, cách diễn đạt khi nói chuyện.",
    category:"DB_NUM",
    active: true
  },
  {
    number: "5",
    content:"Bạn luôn muôn có sự tự do để được trải nghiệm mọi điều của cuộc sống.  <br>
    Số 5 hay gặp may mắn, có nhiều tài lẻ, thông minh sáng tạo, đa tài.",
    advise:"Hãy vận dụng những năng lực mạnh mẽ vốn có trong bạn để đi đến cùng mục tiêu mình đã đặt ra ban đầu. Bạn có thừa năng lực và năng lượng để thành công.",
    category:"DB_NUM",
    active: true
  },
  {
    number: "6",
    content:"Bạn toát lên vẻ hiền hậu và ngây thơ từ gương mặt ánh mắt, nụ cười.  <br>
    Ban là đại diện hình mẫu của người Mẹ,luôn quan tâm, chăm sóc mọi người, tình cảm rộng lớn bao dung <br>
    Bạn coi trọng tình bạn, khát khao tình yêu, luôn quan tâm người khác và luôn mong muốn được nhận sự quan tâm lại.",
    advise:"Hãy luôn phát huy sức mạnh của tình yêu, bởi nó là nguồn cảm hứng trong công việc và cuộc sống của bạn. Mọi rắc rối đềuc so thể hóa giải bằng tình chân ái",
    category:"DB_NUM",
    active: true
  },
  {
    number: "7",
    content:"Bạn là người giỏi quan sát, suy luận, tự tư duy và đúc kết ra bài học cho bản thân.  <br>
    Luôn sớm tự đi tìm triết lý sống cho mình, và thường là những người trầm tính, già dặn trước tuổi.",
    advise:"Hãy luôn luôn học hỏi, đọc sách, tiếp thu kiên thức để tích lũy cho cuộc sống, để xứng tầm là con số tri thức và nắm tri thức nhân loại.",
    category:"DB_NUM",
    active: true
  },
  {
    number: "8",
    content:"Bạn có năng lực điều hành quản trị, quản lý tài chính.  <br>
    Bạn chăm chỉ và say mê công việc, giành nhiều thời gian cho công việc.  <br>
    Từ bạn toát lên một phong thái mạnh mẽ, sang trọng quý phái.",
    advise:"Hãy rèn luyện khả năng quản trị, khả năng làm kinh doanh của bản thân từ sớm để phát huy thành công vượt trội trong cuộc sống. Nhưng hãy dành 5’ cân nhắc trước những món đồ đắt đỏ nha ban",
    category:"DB_NUM",
    active: true
  },
  {
    number: "9",
    content:"Bạn sử hữu sức mạnh đặc biệt đó là sự thu hút lòng tin của người khác một cách rất tự nhiên ngay từ những lần đầu tiên gặp gỡ, điều đó giúp bạn được rât nhiều người quý mến.  <br>
    Bạn có khả năng lãnh đạo với trực giác mạnh, trí tuệ sáng, và luôn biết hy sinh vì người khác.",
    advise:"Hãy luôn giữ tâm trí bình an và minh mẫn, hãy học hỏi để phát triển bản thân lớn mạnh hơn nữa bởi có rất nhiều người sẽ tin yêu và đi theo bạn. Hãy cẩn trọng hơn với vấn đề tiền bạc.",
    category:"DB_NUM",
    active: true
  },
  {
    number: "11",
    content:"",
    advise:"",
    category:"DB_NUM",
    active: true
  },
  {
    number: "22",
    content:"",
    advise:"",
    category:"DB_NUM",
    active: true
  },
  {
    number: "33",
    content:"",
    advise:"",
    category:"DB_NUM",
    active: true
  },
  #====== attitude number
  {
    number: "1",
    content: "Trong công việc: Bạn luôn thể hiện là một người làm việc độc lập, trách nhiệm, tự trọng cao, quyết liệt khi ra ý kiến và, và thích tự quyết định.  <br>
    Trong mối quan hệ: bạn có xu hướng thích được thể hiện bản thân và thích người khác tin tưởng, ca ngợi thì năng lượng được tăng lên gấp đôi.",
    advise:  "Khi xử lý các vấn đề bạn thể hiện năng lực quyết đoán, dứt khoát, nhưng hãy lắng nghe nhiều hơn, thông cảm và tĩnh lặng một nhịp để thấu hiều và đồng hành cùng những người xung quanh.",
    category: "AT_NUM",
    active: true
  },
  {
    number: "2",
    content: "Thái độ trong công việc: Bạn thường là nhân viên mẫn cán, tận tụy với công ty và đội nhóm, thường hay hy sinh lợi ích của bản thân vì lợi ích chung của tổ chức, thích hợp tác, giúp đỡ người khác trong công việc. <br>
    Trong các mối quan hệ:  Bạn thể hiện sự hòa nhã, thân thiện, nhẹ nhàng, yêu thương, nhạy cảm và cũng dễ bị tổn thương.",
    advise: "Hãy luôn mang năng lực cống hiến tận tâm và yêu thương mọi người để lan tỏa những giá trị tốt đẹp vốn có trong con người bạn nhé!",
    category: "AT_NUM",
    active: true
  },
  {
    number: "3",
    content: "Bạn thường thích làm việc nhóm và có khả năng kết nói, hớp tác vì mục đích chung tốt, khi làm việc hay có nhiều ý tưởng, giải pháp vô cùng sáng tạo. <br>
    Thích làm việc với những người vui vẻ, và những nơi tạo cảm hứng.  <br>
    Trong mối quan hệ, bạn để lại ấn tượng sự lạc quan, thân thiện trong cuộc trò chuyện. Bạn hay có cách gọi chuyện và các câu chuyện vui làm người đối diện luôn cười không ngừng.",
    advise: "Hãy luôn song với tâm thế lạc quan với cuộc sống và chia sẻ năng lượng đó với mọi người bạn nhé. Bạn như bông hoa hướng dương rực nở và làm mọi thứ xung quang bỗng tươi sáng cùng với bạn.",
    category: "AT_NUM",
    active: true
  },
  {
    number: "4",
    content: "Thái độ trong công việc với bạn cần thiết sự nghiêm túc, trách nhiệm và trung thực. Bạn thường lên kế hoạch rõ ràng cho công việc, thái độ hợp tác chân thành với đồng nghiệp, sẵn sàng chia sẻ kiến thức,và cách làm việc cho họ. <br>
    Trong mối quan hệ: bạn không phải là người giao tế rộng rãi, nhưng lại là người bạn đáng trân quý bởi sự chân thành, đáng tin cậy và rất nhiệt tình.",
    advise: "Chân thật là điều đáng quý vô cùng, nhưng nếu những bạn diễn đtạ nó bằng những ngôn từ tinh tế hơn, chắc chắn bạn sẽ có những mối quan hệ hòa hảo hơn thế nữa.",
    category:"AT_NUM",
    active: true
  },
  {
    number: "5",
    content:"Thái độ trong công việc: của người có chỉ số thái độ 5 sẽ rất khác lạ. Hoặc bạn  sẽ là người vô cùng nhiệt thành và năng lượng, bạn có thể tạo những đột phá lớn lao trong hiệu suất công việc được giao, nếu công việc đó cho bạn đủ sự tự do và khám phá những điều mới mẻ. Hoặc bạn sẽ thấy chán nản, mất hứng nếu đó là môi trường kỷ luật khà khắc và nhám chán. <br>
    Trong mối quan hệ bạn được đánh giá là người sôi nổi, năng lượng, tươi vui, yêu cuộc đời, hay rủ rê bạn bè vào những cuộc vui. ",
    advise:"Bạn mang một con số có năng lượng như vũ bão, hãy tận dụng và khai thác điều đó, hãy nuôi dưỡng nó bằng cách luôn tìm hiểu khám phá những điều mới mẻ, hãy cho mình trải nghiệm và thử thách.",
    category:"AT_NUM",
    active: true
  },
  {
    number: "6",
    content:"Thái độ trong công việc bạn luôn thể hiện là người có trách nhiệm, lo lắng cho mọi công việc từ những điều nhỏ nhất, và ẩn sâu bên trong bạn luôn muốn thể hiện mình là người có giá trị quan trọng trong công ty hoặc dự án. Và để trở thành người như vậy bạn cần có kiến thức chuyên sâu tốt, tập trung và nắm rõ mọi chi tiết công việc chung đó. <br>
    Trong mối quan hệ bạn luôn được đánh giá là người tốt bụng, luôn  quan tâm, chăm sóc, lo lắng đến mọi người, sẵn sàng chỉ đẫn, tư vấn, dạy dỗ thậm chí là làm thay công việc của họ.",
    advise:"Yêu thương và cảm thông là cụm từ bạn thường hay tự nhắc mình quay về với các mối quan hệ dù có sảy ra bất kỳ mâu thuẫn gì chăng nữa. Đó là điều vô cùng đẹp đẽ trong trái tim bạn, hay luôn bao dung hơn để cuộc sống dễ dàng hơn. Tuy nhiên bạn nên học cách tin tưởng vào năng lực của người khác khi họ nhận thực thi công việc nào đó, tránh lo toan quá mức và hãy nhớ việc được nhận niêm tin của ai đó cũng là sự tự hào của bất kỳ ai.",
    category:"AT_NUM",
    active: true
  },
  {
    number: "7",
    content:"Thái độ trong công việc: Thích làm việc lặng lẽ 1 mình, có sự độc lập nhưng thiếu sự sôi nổi, rất ngang bướng, rất ghét sự điều khiển, luôn có sự quan sát rất tinh tế (cả quan điểm của người khác). Có câu hỏi sâu sắc trong khi thảo luận. Trong công việc nếu xung đột thì họ không hợp tác nữa. Họ làm việc 1 cách có kiến thức không phải theo cảm tính.Không quan tâm người khác nghĩ gì. <br>
    Trong mối quan hệ: Thường là người kín đáo, khó hiểu, không muốn người khác biết về mình, thái độ lạnh nhạt, thờ ơ, khó gần, nhiều khi hơi đơn độc.",
    advise:"Sở hữu một số 7 là một sự may mắn cho  cho sự phát triển trí tuệ của bạn. Số 7 yêu tri thức, luôn thích tìm tòi sâu sắc nhiều vấn đề, nên với sự trợ giúp năng lượng rung của số 7 bạn được coi như cuốn Từ điển sống. Hãy học và đọc nhiều hơn, và hãy khiêm nhường một chút, bạn sẽ ngộ rất nhiều điều thú vị và sâu sắc của cuộc sống!",
    category:"AT_NUM",
    active: true
  },
  {
    number: "8",
    content:"Trong công việc bạn thực sự toát lên năng lượng của người làm quản lý với khả năng bao quát rất tốt mọi vấn đề. Bạn thực sự có thể được gọi là một nhân viên mẫn cán hay kẻ nghiện công việc ấy. Bạn vô cùng trách nhiệm, tận tụy và đắm chìm trong những công việc của mình. <br>
    Trong mối quan hê bạn thường thể hiện là người thực tế và thường đưa ra những góp ý thẳng thắn cũng như bản thân hay bộc bạch, tâm sự thẳng thắn với bạn bè. Bạn sắn sàng tranh luận tới cùng một vấn đề để tìm ra kết luận đúng - sai.",
    advise:"Sự công bằng, công tâm là điều bạn mong muốn và luôn hưởng tới dù trong công việc hay cuộc sống riêng, sự thẳng thắn đó là điều tuyệt vời trong con người bạn. Tuy nhiên nếu mọi thứ đều không thể rõ nét phân rằn như một đường thẳng nên sự thông cảm là điều cần thiết sau mỗi vấn đề sảy ra, hãy thấu hiểu và thương yêu nhiều hơn.",
    category:"AT_NUM",
    active: true
  },
  {
    number: "9",
    content:"Thái độ trong công việc của bạn mang số 9 có nghĩa là bạn luôn có tinh thần trách nhiệm rất cao và chữ tín là ưu tiên hàng đầu của bạn. Bạn còn thể hiện sự thông minh, chủ động, thần thái của một nhà lãnh đạo trong công việc của mình. Bạn luôn được đánh giá là người có nhiều tiềm năng, là tấm gương cho mọi người noi theo khi làm việc  <br>
   Trong mối quan hệ bạn thể hiện là người nhân hậu, rộng rãi, dễ hợp tác. Bạn rất coi trọng con người, coi trọng tình cảm và các mối quan hệ xã hội. Ai cần tới sự giúp đỡ của bạn, hoặc thấy cảnh ngộ ở bất kỳ đâu bạn luôn sẵn lòng giúp đỡ.",
    advise:"Hãy rèn luyện kỹ năng lãnh đạo từ sớm, bởi bạn sẽ luôn phù hợp với vai trò đó. Luôn tu dưỡng mình cả về đạo đức và theo đuổi một chuyện môn sâu, bạn sẽ tỏa sáng rất sớm.",
    category:"AT_NUM",
    active: true
  },
  {
    number: "11",
    content:"",
    advise:"",
    category:"AT_NUM",
    active: true
  },
  {
    number: "22",
    content:"",
    advise:"",
    category:"AT_NUM",
    active: true
  },
  {
    number: "33",
    content:"",
    advise:"",
    category:"AT_NUM",
    active: true
  },

  #====== personal number
  {
    number: "1",
    content: "Bạn là một người tiên phong, luôn xông pha lên phía trước.  <br>
    Tự chủ, độc lập, kiên định và không thích bị sai khiến.  <br>
    Thể hiện bên ngoài phong thái uy lực của người lãnh đạo",
    advise:  "Hãy xây dựng hình ảnh cá nhân là một người thủ lĩnh vừa có tầm, và có tâm  <br>
    Hãy tập kỹ năng lắng nghe người khác trước khi đưa ra lời nói phản biện. Hãy mở lòng đón nhận lời góp ý của mọi người với thái độ thành tâm, bởi nó sẽ giúp bạn lên một tầm cao mới.",
    category: "PE_NUM",
    active: true
  },
  {
    number: "2",
    content: "Bạn muốn thể hiện mình là người sống hài hòa, tình cảm, nhẹ nhàng, dễ gần  <br>
    Trực giác tốt, đồng cảm và coi trọng các mối quan hệ.  <br>
    Là chuyên gia kết nối và xoa dịu các nỗi đau",
    advise: "Vì hay lưỡng lự, để tình cảm chi phối nên có thể bạn đã bỏ lỡ một số cơ hội trôi qua.  <br>
    Hãy tập cho mình sự tự tin, giảm thiểu sự nhút nhát e ngại, để có sự quyết liệt hơn trong xử lý tình huống",
    category: "PE_NUM",
    active: true
  },
  {
    number: "3",
    content: "Người khác đánh giá bạn là người hướng ngoại, thích giao lưu kết bạn với nhiều người. <br>
    Bạn rất thông minh, thích sự vui vẻ và đầy tính hài hước, có tính nghệ sỹ và thường xuyên nở nụ cười rạng rỡ.",
    advise: "Chỉ phát huy tốt sở trường khi được làm việc trong môi trường giao tiếp nhiều, năng động, không phù hợp với công tác ngiên cứu, phòng thí nghiệm. <br>
    Hãy kiểm soát tính tập trung và kỷ luật bản thân, tạo cảm hứng cho chính mình trong mọi công việc và cuộc sống.",
    category: "PE_NUM",
    active: true
  },
  {
    number: "4",
    content: "Bạn được đánh giá là người rất nghiệm túc, có trách nhiệm, có khả năng quản lý và tổ chức tốt. <br>
    Sự kỷ luât, trật tự, sự an toàn là điều bạn luôn hướng tới <br>
    Coi trọng tình bạn, tình cảm gia đình và những giá trị truyền thống. <br>
    Thể hiện rất tốt.",
    advise: "Duy trì và phát huy tính kỷ luật để có thành công tốt hơn. Hãy rèn luyện khả năng giao tiếp, trao đổi, chia sẻ  nhiều hơn để giảm bớt sự đơn điệu trong cách nói chuyện. Cần linh động và hoạt bát hơn trong các vấn đề, giảm bớt sự đa nghi và chi tiết quá mức để tiếp cận các vấn đề mới dễ dàng hơn, cởi mở hơn.",
    category:"PE_NUM",
    active: true
  },
  {
    number: "5",
    content:"Bạn được đánh giá là người rất sôi nổi, nhiệt tình, vui vẻ và nhiều năng lượng. <br>
    Bạn thích sự tự do, khám phá, phiêu lưu mạo hiểm và trải nghiệm những điều mới mẻ. <br>
    Bạn thông minh có nhiều tài lẻ và có sức quyến rũ lớn đối với người khác phái.",
    advise:"Sự năng động, sáng tạo luôn sẵn có và cuộn trào trong bạn, chỉ cần bạn hãy luôn tập trung theo đuổi mục tiêu, giữ nguồn năng lượng đó chạy ổn định, luôn tạo môi trường cảm hứng thi thành quả tốt nhất bạn luôn dễ dàng đạt được. Suy nghĩ cẩn trọng trước khi ra quyết định thay đổi một sự việc hay mối quan hệ tình cảm",
    category:"PE_NUM",
    active: true
  },
  {
    number: "6",
    content:"Bạn là người yêu thương, quan tâm và bao dung nhất. Bạn mang hình ảnh một Người Mẹ hiền hòa tới tất cả mọi người. <br>
    Yêu hòa bình, rất được mọi người yêu quý. <br>
    Bạn mang gương mặt đôn hậu, nụ cười ấm áp có đôi nét ngây thơ.",
    advise:"Bạn hãy nên tin tưởng vào khả năng của người khác thay vì lo lắng cho mọi người một cách thái quá, nhất là với con cái, người thân yêu của mình để họ có sự tư chủ, đừng bao bọc quá nhiều. Hãy nhỡ bạn đã và đang làm mọi việc rất tốt rồi và ai cũng yêu mến sự tận tâm và trách nhiệm của bạn.",
    category:"PE_NUM",
    active: true
  },
  {
    number: "7",
    content:"Bạn mang một vẻ ngoài khá là lạnh lùng, bí ẩn và đơn độc và hay muốn tách mình khỏi tập thể, tuy nhiên bạn cực kỳ tốt bụng và nhân ái. <br>
    Bạn là người thông thái, tôn trọng tri thức và cực kỳ nhiều kiến thức. <br>
     Không tham vọng và yêu thiên nhiên <br>
    Là người thầy về chia sẻ kiến thức, kinh nghiệm, trải nghiệm của bản thân",
    advise:"Hãy mang đến cuộc sống một thái độ tràn hòa, yêu thương nhiều hơn, tình cảm và hòa nhập hơn nữa để những điều tốt đẹp trong bạn được lan tỏa  <br>
    Thực hành nhiều hơn những tri thức mà bạn tự đúc kết, tìm hiểu và tự suy nghẫm, và  biến sự suy nghĩ thành hành động cụ thể",
    category:"PE_NUM",
    active: true
  },
  {
    number: "8",
    content:"Bạn thường thể hiện ra bên ngoài là một sự uy quyền hoặc giàu sang choáng ngợp bất kỳ ai. <br>
    Có tố chất  kinh doanh giỏi và là người quản lý tài chính, bao quát giỏi. <br>
    Bạn say mê làm việc, đắm chìm trong công việc và cùng có trách nhiệm  Thích được làm việc, coi công việc là niềm đam mê",
    advise:"Yêu lao động và chăm chỉ kiếm tiền luôn là sự thúc đẩy lớn đối với người số 8 nhưng hãy luôn nhớ tự thưởng cho bản thân những kỳ nghỉ ngơi, dành thời gian cùng gia đình thân yêu xen giữa lịch làm việc của bạn nhé",
    category:"PE_NUM",
    active: true
  },
  {
    number: "9",
    content:"Bạn luôn thể hiện là một người nhân hậu, tốt bụng, luôn sống vì người khác nên được mọi người tin yêu. <br>
    Người khác luôn thấy bạn mang một tầm vóc lớn, một người có khả năng lãnh đạo và thu hút được niềm tin yêu của mọi người.",
    advise:" Hãy rèn luyện cho mình thật giỏi về chuyên môn để trở thành người lãnh đạo xuất chúng, vừa có tâm vừa có tầm. <br>
    - Hãy thể hiện khả năng lãnh đạo, rèn luyện từ việc nhỏ nhất trước khi làm việc lớn, để trở thành một lãnh tụ tinh thần và người dẫn dắt, lãnh đạo tương lai.",
    category:"PE_NUM",
    active: true
  },
  {
    number: "11",
    content:"",
    advise:"",
    category:"PE_NUM",
    active: true
  },
  {
    number: "22",
    content:"",
    advise:"",
    category:"PE_NUM",
    active: true
  },
  {
    number: "33",
    content:"",
    advise:"",
    category:"PE_NUM",
    active: true
  },
#========
#====== life path number
{
  number: "1",
  content: "Con số chủ đạo của bạn là số 1 – bạn được hưởng năng lượng tích cực từ Mặt trời rực lửa. Với một trí lực mạnh mẽ, tư duy sáng trí, bạn là hiện thân của người thủ lĩnh can trường, dũng mãnh. Bạn là người tiên phong đầy bạn lĩnh và luôn dẫn đầu tiên phong để đối chọi với mọi khó khăn thử thách. Số 1 mang năng lượng dương mạnh nhất đứng đầu dãy số Pythagore nên được coi là con số của người thống trị đỉnh cao. Số 1 không bao giờ ngại xông pha và đạt ra những mục tiêu chinh phục. <br>
  Mặt trời đốt cháy vạn vật khi ở quá gần, vậy nên năng lượng bạn tỏa ra sôi sục luôn choáng ngợp và lấn át người khác, và muốn chi phối họ, thế nên họ e dè chẳng dám tới gần Mặt trời.",
  advise:  "Sự nghiệp: Bạn có năng lực giải quyết vấn đề cực nhanh và sáng tạo cùng với tố chất của người lãnh đạo. Với bản lĩnh như vậy bạn luôn có sự nghiệp khá vững vàng, thường đứng vai trò làm chủ. Nhưng bạn hãy nhớ luôn kết nối với người bên dưới với tâm thế bình đẳng, hợp tác. <br>
  Tình yêu: Người số 1 trong tình yêu luôn là người trung thành, nhất quán. Vì vậy bạn xứng đáng được người bạn đời đặt lòng tin tuyệt đối. Bạn rất nồng nhiêt trong tình yêu và luôn tặng đối phương những món quà bất ngờ. Nhưng để được như vậy, bạn cũng đã bỏ ra khá nhiều thời gian và thử thách đối phương tạo sự tin tưởng. Và khi đã trinh phục được lòng tin của số 1, thì đối tác đó sẽ là cuối cùng và mãi mãi. <br>
  Bài học: Sớm nhận thức và định vị được bản thân mình, số 1 hãy luôn rèn luyện từ lức nhỏ để trở thành một thủ lĩnh phi thường. Sự độc lập, cá tính là thế mạnh để bạn nhắm tới mục tiêu cuộc sống, nhưng cá tính cá nhân quá cao sẽ không tránh khỏi sự cứng nhắc và chi phối của sống của người khác. Hãy nhìn nhận bài học đó sâu sắc và rút kinh nghiệm để cuộc sống an hòa hơn.",
  category: "LP_NUM",
  active: true
},
{
  number: "2",
  content: "Theo Pythagore, con số chủ đạo của bạn là số 2 – bạn được hưởng năng lượng của Mặt trăng dịu êm. Bạn rất giỏi kết nối và chạm vào cảm xúc của người khác bằng sự trân thành của mình. Và đồng thời bạn luôn biết xoa dịu các hiềm khích, tạo không khí hòa hảo để kết nối mọi người với nhau. Nên bạn trong tâm tưởng và trong con mắt mọi người hiện lên hình ảnh một chú bồ câu hiền hòa. <br>
  Sự nhạy cảm quá mức sẽ khiến bạn đôi lúc hay e dè, ít thể hiện bản thân và ngại nói ra những cảm xúc của mình, điều đó sẽ làm những người xung quanh khó đọc hết tâm ý của bạn.",
  advise: "Trong sự nghiệp người mang số Đường Đời 2 luôn thể hiện sự bền bỉ, tận tâm lo cho công việc và đội nhóm. Sự nhẫn nại của bạn thể hiện ở việc bạn kiên nhẫn làm việc cho một công ty trong thời gian dài, và họ dần đến với thành công ở lĩnh vực bạn quan tâm. <br>
  Tình yêu của bạn chắc chắn rất đặc biệt và dành cho người đặc biệt với bạn, bởi bạn luôn dành rất nhiều thời gian để tìm kiếm tình yêu đích thực. Và cách bạn dành cho tình yêu là sự trải nghiệm cảm xúc lãng mạn trong tâm hồn bạn và trong bầu không khí mà bạn tạo ra  cho đối phương. <br>
  Cuộc sống với bạn là sự liên kết hợp tác, và bạn thêm vào đó màu sắc của tình yêu thương và thấu cảm, nhưng hãy nên nhớ sự cho đi đủ và không nên cầu thị sự đáp trả thì cuộc sống sẽ dễ dàng hơn.",
  category: "LP_NUM",
  active: true
},
{
  number: "3",
  content: "Bạn là hiện diện của sự bộc lộ bản thân và lan tỏa những giá trị mình có. Bạn luôn được nhắc đến là một người thông minh, vô cùng nhiều ý tưởng, khiếu hài hước, sự vui vẻ và hoạt ngôn. Bạn luôn biết khéo léo trình bày quan điểm cá nhân, lồng ghép vào những ý tưởng của người khác, hoặc trích lời các danh nhân làm lời nói bạn có trọng  lượng và sức ảnh hưởng lớn hơn. Ngoài ra số 3 luôn có điểm nhấn vô cùng mạnh mẽ nào đó khiến sự bộc lộ của bản thân bạn ra ngoài, trở thành niềm cảm hứng, lan tỏa tới mọi người. <br>
  Mang trong mình số 3 sẽ là bùng nổ và lan tỏa nếu bạn được thúc đẩy và cổ vũ nhưng nếu nhốt mình trong vùng thoải mái",
  advise: "",
  category: "LP_NUM",
  active: true
},
{
  number: "4",
  content: "Bạn mang con số Chủ đạo số 4, có nghĩa năng lượng rung của bạn tăng cường khả năng làm việc rất kỷ luật, tỉ mỉ theo trật tự, mọi thứ hỗn độn đều có thể được bạn sắp xếp vào khuôn khổ trật tự của nó. Công việc và cuộc sống của bạn luôn gắn liền với tính kỷ luật, sự sắp xếp logic và những con số. Bạn coi trong sự đúng giờ và tuân theo các qui định luật lệ nghiêm khắc một cách thoải mái. <br>
  Kỷ luật là ngọn đuốc để hướng bạn đến thành công chắc chắn nhưng hãy học hỏi thêm sự linh hoạt và ứng biến cho cuộc sống nhiều màu sắc hơn bạn nhé !",
  advise: "Sự nghiệp: Sự đào sâu kiến thức, làm việc tỉ mỉ và kỷ luật sẽ giúp bạn có một sự nghiệp vững chắc. Bạn thường sẽ giữ trọng trách như một chuyên gia, một nhà quản lý chiến lược, khả năng theo đuổi những dự án dài và khó khăn. Bạn như phần cốt lõi, người không thể thiếu trong công ty, tổ chức. <br>
  Tình yêu: Bạn là người yêu, người bạn đời rất chung thủy và đáng tin cậy. Và người đó của bạn cũng phải thu phục được lòng tin từ bạn thì người đó sẽ cùng bạn để xây dựng tình yêu lý tưởng đến cuối đời. <br>
  Bài học mà đường đời số 4 muốn chỉ cho bạn, sự làm việc kỷ luật và cẩn trọng vốn hoàn toàn không thuộc về bạn từ nhỏ, mà bạn phải trải qua những vấn đề liên tiếp quanh câu chuyện kỷ luật để có được con người hôm nay. Chúc mừng ban !!!",
  category:"LP_NUM",
  active: true
},
{
  number: "5",
  content:"Khi bạn mang con số Chủ Đạo là số 5, sẽ không có gì là với sức sáng tạo đột phá vô hạn định của bạn. Bạn luôn sôi nổi cuồng nhiệt và đam mê, sự yêu thích phiêu lưu, sự tự do luôn bộc lộ cả trên thể chất lần tinh thần. Thường bạn thích tận hưởng cuộc sống bằng đẩy đủ các giác quan nhạy bén của mình. Thật tuyệt vời khi mang trong mình năng lượng cuồng nhiệt của số 5. <br>
  Bạn luôn sống trong thực tại với tâm thế mạnh mẽ mà không hề bị quá lo cho tương lai hay cứ ảm đạm với quá khứ. Chỉ có thực tại mới làm thay đổi cảm xúc trọng bạn mạnh mẽ, hãy kiểm soát nó nếu bạn có thêm những bộ số của cảm xúc nhé!",
  advise:"Sự nghiệp: Bạn thường chỉ yêu thích và làm công việc cho bạn sự kích thích, khám phá và tìm tòi cái mới. Bạn giỏi ở rất nhiều lĩnh vực và thường theo đuổi nhiều dự án khác nhau, nên sẽ không lạ nếu mọi người bắt gặp bạn ở nhiều công ty và công việc, bạn có thể đang gây ra một sự bùng nổ doanh số, hoặc ý tưởng mới lạ. <br>
  Tình yêu: đam mê, phiêu lưu và khám phá điều mới nằm sẵn trong con người của bạn. Nên các cuộc tình sau khi hết cho bạn những điều trên thì nó trở nên tẻ nhạt vô cùng và bạn lại nhanh chóng đi tìm cuộc tình mới cho đến khi gặp một đối tác cho bạn sự yêu thích tìm hiểu và cam kết đủ mạnh bạn lại trở thành người bạn đời trung thành nhất trong thời gian dài. <br>
  Bài học cho số 5 trước khi đến với cuộc đời đầy ngẫu hứng và màu sắc sối động thì có thể bạn đã sống khá là e dè, ngại thay đổi và không quá hứng thú với sự sáng tạo cho đến khi có những sự kiện dẫn dắt bạn chạm đến năng lượng đỉnh cao tích cực của số 5.",
  category:"LP_NUM",
  active: true
},
{
  number: "6",
  content:" Có thể nói chắc chắn một điều rằng những người ở xung quanh bạn luôn cảm thấy sự quan tâm ấm áp từ bạn. Từ bạn toát ra sự chăm sóc và yêu thương, hòa nhã, nhất là với trẻ con, và thực sự bạn có sức hút với con trẻ, chúng yêu quý và quấn quýt bạn. Số 6 trong con số chủ đạo được ví như tấm lòng người mẹ tượng trưng cho sự chăm sóc, nuôi dưỡng và hòa hợp. <br>
  Điều đáng trân quý là bạn luôn dùng hết sức lực và tâm trí bản thân để quan tâm đến những người khác, nhưng hãy luôn cân bằng giữa việc cho và nhận, đôi lúc ham cho quá mà bản thân bi lợi dụng, bị kiệt sức.",
  advise:"Sự nghiệp: Trong công việc bạn luôn hết sức tận tâm tận lực, chăm chút và lo toàn cho mọi việc của công ty, thậm chí cả những công việc không thuộc trách nhiệm của bạn. Bạn có thiên hướng tốt khi làm về những mảng công việc chăm lo cho giáo dục con người, nuôi dưỡng trẻ, hàn gắn yêu thương và xây dựng những gia đình hạnh phúc… <br>
  Tình yêu: Bạn sinh ra để yêu và cống hiến cho tình yêu cũng như người mình yêu thương. Bạn ý thức rõ được mức độ và tầm quan trọng của đối tượng yêu đương và hệ lụy của nó từ những mối quan hệ sai lầm nên bạn rất cân nhắc thận trọng tìm người yêu, bạn đời. Và chắc chắn người đó sẽ cảm thấy vô cùng hạnh phúc trong tình yêu của bạn. <br>
  Bài học từ rung động số 6: bạn sẽ cần phải luôn hiểu sức mạnh của mình từ việc giúp đỡ và hỗ trợ mọi người nhưng đôi lúc hãy để những người xung quanh có không gian riêng dành cho việc họ có thể phải phạm sai lầm và học bài học gì đó từ cuộc đời của họ thì sự giúp đỡ và lời khuyên của bạn có giá trị hơn nữa.",
  category:"LP_NUM",
  active: true
},
{
  number: "7",
  content:"Bạn mang trong mình năng lượng rung của con số 7 chủ đạo giống như bạn chiếm giữ được biểu tượng sự thiêng liêng, trí tuệ và huyền bí mà nó mang lại. Bạn tôn trọng tri thức, và những môn huyền học, bạn luôn quan tâm kỹ đến những vấn đề mình đã trải nghiệm qua, tư duy suy nghĩ về nó, chiêm nghiệm nó để đúc kết nên những luận điểm uyên thâm. <br>
  Điểm nhấn trong con người bạn chính là bạn như một kho sách sống, điều đó khiến mọi người rất trân trọng bạn. Nhưng nếu mình lắng nghe nhiều thêm, bớt sự tự phụ về tri thức của cá nhân biết đâu mình sẽ gạn lọc được nhiều điều thú vị hơn nữa từ người khác.",
  advise:"Sự nghiệp: Thường những người số 7 với trí tuệ cao và suy nghĩ sâu sắc nên họ hay đi vào các lĩnh vực đòi hỏi chuyên môn cao, các nhà khoa học, nhà nghiên cứu đặc biệt về tinh thần và tâm lý, nhà văn, nhạc sĩ, hoặc lĩnh vực đòi hỏi về yếu tố chiến lược. Điểm cơ bản là bạn luôn đẩy tâm trí mình vượt giới hạn và thường nổi trội ở lĩnh vực bạn quan tâm nhưng nhất thiết phải kiên trì. <br>
  Trong tình yêu, con số 7 trong bạn khiến bạn coi trọng tình yêu, tôn thờ và cực kỳ nghiêm túc. Có thể sự biểu lộ ra bên ngoài của bạn hơi mờ nhạt nhưng thực sự trong thâm tâm tình yêu của bạn luôn cuộn chảy. <br>
  Bài học đường đời của số 7, bạn nên hiểu rằng những bài toán khó dành cho học sinh giỏi, và khi những vấn đề đến bạn đủ cân bằng, đủ lớn mạnh và vượt qua nó bằng sự đúc kết và chiêm nghiệm sâu sắc của bản thân, sự đào sâu tri thức sẽ giúp bạn dễ dàng thích nghi và thành công hơn trong cuộc sống.",
  category:"LP_NUM",
  active: true
},
{
  number: "8",
  content:"Chỉ số chủ đạo số 8 dù trong văn hóa phương Tây hay hay phương Đông thì đều là con số đại diện cho sự thành công và may mắn. Bạn luôn thể hiện sự mạnh mẽ và chinh phục các mục tiêu, và luôn thành công với các mục tiêu đó. Quyền lực, danh vọng, vật chất và sức mạnh người số 8 sẽ luôn đtạ được sau những ngày lao đông cực kỳ hang say và nhiệt huyết. <br>
  Cứ nhắc đến bạn là người ta nhìn thấy một con người tỏa sáng với tấm gương chăm chỉ, mẫn cán và say sưa dốc sức cho những công việc, những dự án bạn đang làm. Chính điều đó khiến bạn đôi lúc bỏ bê việc chăm sóc chính mình, hãy giữ gìn sức khỏe nhiều hơn nhé!",
  advise:"Sự nghiệp: của bạn thường ở tầm của những nhà quản lý, doanh nhân, hoặc các nhà lãnh đọa cầm quyền uy thế dựa trên tài năng của bạn là óc quản lý và tổ chức <br>
  Tình yêu: tuy số 8 rất giỏi đọc vị người khác trong thương trường thì bạn lại rất khá khó khăn khi giãi bày tình cảm của bản thân. Bạn đời của bạn chắc hẳn sẽerats vui khi nhận được những món quà sang trọng quý giá từ bạn, nhưng chắn chắn họ sẽ hạnh phúc nếu bạn biểu lộ được tình yêu của mình ra nhiều hơn nữa. <br>
  Bài học đường đời: số 8 nhắn nhủ bạn hãy rèn luyện khả năng lãnh đạo và dám đương đầu khó khăn cũng như phải chăm sóc bản thân và gia đình tốt hơn để sự sự nghiệp luôn đi cùng sức khỏe và gia đình hạnh phúc.",
  category:"LP_NUM",
  active: true
},
{
  number: "9",
  content:"Hình ảnh tuyệt vời mà bạn mang đến cho mọi người là tâm gương của sự cho đi, lòng vị tha, nhân hậu và hướng tới mọi người, tới cộng đồng, mang tầm cỡ bậc vĩ nhân có ảnh hưởng lớn đến xã hội. Số 9 theo quan điểm Thần số học của Pythagore là con số mang năng lượng cao nhất, mang màu sắc của tất cả các rung động số khác. Vậy nên được sở hữu nó là niềm vinh hạnh và chứng tỏ bạn là một người rất sáng trí, thông minh, học nhanh và rất có lý tưởng có hoài bão lớn lao. <br>
  Với trí tuệ thông suốt làm cho số 9 luôn có nhiều hoạt động tinh thần mạnh mẽ đôi lúc dẫn đến sự ức chế và làm bạn mệt mỏi, những lúc đó hãy luôn cân bằng, giữ vững mục tiêu và kiên trì theo lý tưởng mình đang theo đuổi!",
  advise:"Sự nghiệp: số 9 giúp bạn học nhanh đên mức bạn có thể làm bất cứ công việc gì trong thời gian ngắn và kết quả tốt, nhưng thiên hướng mạnh của người số 9 nên hướng về sự cống hiến và giúp đỡ cho cộng đồng không ngừng nghỉ để xã hội trở lên tốt đẹp, công bằng và lý tưởng hơn. <br>
  Tình yêu: được chìm đắm trong tình yêu của bạn chắc hẳn là diễm phúc của người bạn đời. Bạn luôn lý tưởng hóa tình yêu và thêm vào đó đầy đủ gia vị một tình yêu lãng mạn mặn nồng theo đúng nghĩa của nó. <br>
  Bài học đường đời: số 9 ở đường đời luôn đưa cho bạn những cơ hội để thử thách bạn lựa chọn giữa một cuộc sống và sự nghiệp ổn định hay trở thành những nhà lãnh đạo, nhà hoạt động mang tầm cỡ cống hiến rộng cho nhân loại. Hãy tiếp nhận và lựa chọn đúng đắn bạn nhé !",
  category:"LP_NUM",
  active: true
},
{
  number: "11",
  content:"",
  advise:"",
  category:"LP_NUM",
  active: true
},
{
  number: "22",
  content:"",
  advise:"",
  category:"LP_NUM",
  active: true
},
{
  number: "33",
  content:"",
  advise:"",
  category:"LP_NUM",
  active: true
},
#==================
#====== spirit number
{
  number: "1",
  content: "Bạn có sức manh nội tại luôn sôi sục, tinh thần đó luôn truyền năng lượng nhiệt huyết giúp bạn đứng lên một cách bản lĩnh để tiến tới chiên thắng. Bạn luôn hướng đến mục tiêu và được tự do để thực thi điều mình muốn luôn muốn được khẳng định bản thân, làm chủ trong mọi tình huống <br>
  Khao khát muốn mọi thứ hoàn thiện đôi khi đặt áp lực quá cao trong con người bạn, và cho chính bạn. Hãy nhìn mình trong gương mỉm cười và tự hào đi nào. Bạn xứng đáng được nhận sự tự hào về chính mình sau rất nhiều nỗ lực đó!",
  advise:  "Hãy luôn tin tưởng bản thân và nội lực của chính mình, hãy tin vào năng lượng của người thủ lĩnh mạnh mẽ bên trong bạn.",
  category: "SP_NUM",
  active: true
},
{
  number: "2",
  content: "Cho dù bạn là nam hay nữ  thì sâu thẳm con người bên trong của bạn luôn yêu thích sự hài hòa, yên ấm, bình an và hạnh phúc trong các mối quan hệ. Chính vì vậy bạn luôn có những khát khao thầm kín hướng tới một tình yêu đẹp đẽ. Khả năng trực giác rất mạnh có thể cho bạn những linh cảm trước những vấn đề có thể sảy ra, hoặc những giấc mơ báo trước sự thật. <br>
  Bạn là người khong có tham vọng nhiều về tài chính hay quyền lực mà cái bạn hướng tới chỉ là sự bình an và tình yêu đẹp. Nên đôi khi bạn khá e dè trước những quyết định thay đổi, hãy tin tưởng vào trực giác và hãy mạnh dạn và dấn thân hơn khi trực giác bạn lên tiếng.",
  advise: "Điều mà nhu cầu nội tâm sâu thẳm của bạn luôn quan tâm chính là làm thế nào để cảm thấy hạnh phúc, mà đôi lúc bạn lại bỏ qua cái lý do thực sự đó chính là việc bạn quan tâm chú đáo, ân cần cho ai đó, lại là thời điểm làm bạn hạnh phúc đấy. Bạn luôn ưa thích và hướng đến một môi trường mọi mối quan hệ trong đó đều bền chặt, chia sẻ cảm xúc, bình yên.",
  category: "SP_NUM",
  active: true
},
{
  number: "3",
  content: "Trong tâm khảm linh hồn số, 3 bạn hiểu rất rõ sức mạnh của ngôn từ và luôn khao khát sở hữu năng lực đó, vậy nên bạn luôn để ý và rèn luyện điều đó mỗi ngày khi có thể. Niềm vui và hạnh phúc lớn nhất của bạn chính là sự dụng ngôn từ và thu hút sự chú ý, tạo niềm vui cho mọi người thông qua sự diễn đạt của bản thân.  <br>
  Bạn luôn biết cách chọn lọc ngôn từ một cách có chừng mực nhất để diễn đạt mọi thứ, nên bạn sẽ không hay khoe khoang về bản thân quá như những con số 3 ở ví trị khác. Và có một nỗi niềm ẩn sâu về sự sợ nỗi cô đơn lẩn khuất đâu đó nên bạn luôn thích thú chỗ đông người, với những câu chuyện vui vẻ và thu hút.",
  advise: "Sự khao khát hướng tới việc xuất hiện và tạo ảnh hưởng trước tập thể, khao khát trở nên vĩ đại trước đám đông, là động lực rất mạnh mẽ giúp sự thông minh vốn sẵn có của bạn được định hướng, được sử dụng và làm giàu vốn kiến thúc trong bạn. Hãy luôn duy trì nguồn năng lượng tuyệt vời đó để mang những giá trị của bản thân đóng góp cho xã hội bạn nhé !",
  category: "SP_NUM",
  active: true
},
{
  number: "4",
  content: "Sở hữu chỉ số Linh hồn 4 bạn là người rất tôn thờ sự rõ ràng, kỷ luật, tỉ mỉ và trình tự. Khi làm bất cứ công việc gì bạn đều âm thầm xem xét theo dõi mọi vấn đề một cách chi tiết nhất, kỹ lượng nhất, bạn dành rất nhiều thời gian tâm sức cho điều đó. <br>
  Có một niềm tin về sự vững trãi và đáng tin cậy trong con người của bạn nên những người bên cạnh sẽ có cảm giác bạn như một bức tường vững trãi mà họ có thể dựa vào và tìm kiếm khi họ bất ổn.",
  advise: "Bạn chỉ cảm thấy ổn khi mọi thứ bạn đều nắm bắt được đầy đủ thông tin, mọi kế hoạch, còn không bạn lại tiếp tục dành tâm sức để tìm kiếm, phân tích, tìm kiếm… Sự cân bằng thư giãn, tận hưởng cuộc sống và giảm bớt yêu cầu của sự tỉ mỉ mà bản thân đặt ra sẽ giúp bạn cân bằng về tâm trí và sức khỏe và các mối quan hệ!",
  category:"SP_NUM",
  active: true
},
{
  number: "5",
  content:"Chỉ số Linh hồn 5 mà bạn đang sở hữu giúp bạn có sức sáng tạo và khám phá mạnh mẽ vô cùng tận, ý tưởng tuôn chảy trong bạn cuồn cuộn nhưng bạn hiếm khi chia sẻ những ý tưởng đó ra ngoài. <br>
  Bạn biết rất rõ nội tâm mình cần gì và không ngại thay đổi, không ngại thử thách, thử đến khi đúng và hoàn thiện thì thôi. Đó là điểm mạnh vô cùng lớn của những người thành công – Bạn không bao giờ gục ngã trước những sai lầm bởi với bạn đó chỉ là những trải nghiệm sống để hoàn thiện mà thôi.",
  advise:"Hãy dám dấn thân để được trải nghiệm và sống đầy đủ trong các ý tưởng của mình. Nên tạo điều kiện cho mình được làm việc ở môi trường tự do, năng động và sử dụng dòng năng lượng sáng tạo cuộn chảy trong bạn nhé! ",
  category:"SP_NUM",
  active: true
},
{
  number: "6",
  content:"Bạn mang trong mình năng lượng rung động của chỉ số Linh hồn 6, được ví như trái tim của người cha. Bởi bạn luôn ở đó, quan sát và nắm bắt mọi tình thế và thấu hiểu từng con người một cách âm thầm nhưng mọi sự việc đều cần đến thời điểm bạn sẵn lòng giang tay giúp đỡ.  <br>
  Trong sâu thẳm bạn yêu thích con trẻ, tôn thờ những điều mang tính ngây thơ và hồn nhiên đó, một mái ấm và tiếng cười trẻ thơ.",
  advise:"Hãy luôn tạo môi trường cho tình yêu thương bên trong bạn được gieo hạt nảy trồi. Với óc thẩm mỹ rất hài hòa và dệt màu chất liệu tình yêu thương, bạn hãy mang năng lực này ra thế giới để tạo lên những điều tốt về chất và đẹp về hình, đóng góp những giá trị tích cực cho xã hội!",
  category:"SP_NUM",
  active: true
},
{
  number: "7",
  content:"Sở hữu năng lượng rung động của con số 7 ở bất kỳ đâu thì cũng đã là người người luôn thiên về thế giới tinh thần rồi, nhưng con số 7 của bạn còn nằm ở ngay vị trí bên trong – chỉ số Linh hồn nên điều này khiến sự tập trung cho phần bên trong đó càng trở lên mạnh mẽ hơn nữa.  Bạn luôn chìm đắm trong đó đào sâu sự tự tìm hiểu về bản thân, chiêm nghiệm, và tìm kiếm triết lý. Số 7 luôn tôn trọng tri thức và luôn cố gắng lý giải mọi sự kiện mọi vấn đề xung quanh bạn bằng những tri thức sâu sắc mà bạn đúng kết được. <br>
  Thế giới bên trong của bạn vô cùng thú vị với nhiều vấn đề độc đáo, nên để nuôi dưỡng nó, bạn thường có xu thế muốn ở một mình tách biệt, và điều đó đôi lúc khiến người khác hiểu lầm bạn  trong môi trường xã hội cộng đồng. Hãy cởi mở hơn một chút, chia sẻ ra ngoài nhiều hơn, chắc hẳn tri thức mà bạn tích cóp được sẽ giúp ích cho rất nhiều người đó!",
  advise:"Hãy cân bằng đời sống thực tại và thế giới tinh thần, nên dùng kiến thức và tư duy của mình để giúp đỡ mọi người. Bạn nên thường xuyên sống gần thiên nhiên, hoặc không gian riêng biệt để cảm thấy thoải mái và tái tạo năng lượng sống nhé.",
  category:"SP_NUM",
  active: true
},
{
  number: "8",
  content:"Chúc mừng bạn sở hữu tầng rung động năng lượng của con số 8 ở chỉ số Linh hồn. Điều đó thể hiện bạn là người có nội lực mạnh mẽ, tập trung, thực tế và công bằng. Bạn có những kế hoạch rõ ràng cho mình để có những bước phát triển trong tương lai những thường bạn sẽ kín đáo và ít chia sẻ điều đó ra ngoài.  <br>
  Bạn luôn hướng sự đam mê đến công việc và sự nghiệp nhất là những vấn đề liên quan kinh doanh hoặc chính trị. Bạn thường dành rất nhiều thời gian, tích cực làm việc, nó không chỉ là sự chăm chỉ đơn thuần mà đầy tính kỷ luật và và khát khao thành công.",
  advise:"Cần nổ lực, phấn đấu, tạo môi trường từ nhỏ để năng lực được bộc lộ và rèn luyện nhiều để vượt qua khó khăn. Bạn nên học cách lắng nghe người khác, mở lòng để thấu hiểu mọi người và học cách rút kinh nghiệp cho mình thông qua những bài học của người khác. Bạn rất có tố chất để hướng tới thành công nhưng hãy luôn nhớ trong mọi trường hợp cần rèn luyện và để tâm đến sức khỏe của mình nhé!",
  category:"SP_NUM",
  active: true
},
{
  number: "9",
  content:"Bạn sở hữu nhân cách bên trong đầy tính nhân hậu, rộng lượng và đầy lòng vị tha bởi ảnh hưởng của rung động của số 9 nằm trong chỉ số Linh hồn, tuy nhiên điều đó không dễ dàng được bộc lộ ra bên ngoài. Bạn luôn có khao khát và lòng thúc đẩy muốn làm việc cống hiến cho cộng đồng./
  Bạn luôn hướng tới tình yêu, tình yêu của bạn nó rộng lớn, hướng nhân loại chứ không chỉ dừng ở việc tìm kiếm một chân ái trong cuộc đời. Sô 9 trong tâm hồn cũng dễ bị tổn thương nhưng bạn thường che giấu những tổn thương đó và bỏ qua lỗi lầm của người khác.",
  advise:"Năng lượng của sự thông thái số 9 luôn cho bạn khả năng học tập nhanh nhiều vấn đề, nhưng nhất thiết nên chọn một hướng đi để chuyên tâm dành toàn sức cho mục đích đó. Và làm sao cho mục đích đó cũng hướng tới xây dụng một xã hội tốt đẹp hơn, nhân văn hơn thì những khát khao của bạn sẽ được thỏa nguyện.",
  category:"SP_NUM",
  active: true
},
{
  number: "11",
  content:"",
  advise:"",
  category:"SP_NUM",
  active: true
},
{
  number: "22",
  content:"",
  advise:"",
  category:"SP_NUM",
  active: true
},
{
  number: "33",
  content:"",
  advise:"",
  category:"SP_NUM",
  active: true
},

#======================
#====== fafe number
{
  number: "1",
  content: "Bạn sinh ra được mang một cái tên với rung động mạnh mẽ của con số 1 ở chỉ số Sứ mệnh, thể hiện bạn hoàn toàn làm chủ tình thế và cuộc đời của bạn, bởi tính độc lập rất cao, sự tự khẳng định mình và năng lực  của người lãnh đạo tuôn chảy trong bạn và thuộc về bạn như một lẽ tự nhiên vốn có vậy. <br>
  Khi vào tuổi trưởng thành, bạn thường sẽ là những người gây dựng được một sự nghiệp vững chắc, ổn định. Sứ mệnh của bạn là trở thành một nhà lãnh đạo tài ba, một thủ lĩnh, người tiên phong. Bạn đến với cuộc đời này để dẫn dắt và chinh phục khó khăn. Sứ mệnh của bạn là gây ấn tượng tốt cho mọi người xung quanh và chinh phục được đám đông. ",
  advise:  "Bởi con số Sứ mệnh 1 mà bạn sở hữu khiến bạn luôn mong muốn mãnh liệt trở thành người giỏi nhất, bạn đặt cho mình tiêu chí cao nhất và kỳ vọng người khác cũng như vậy. Điều bạn cần làm là cần cho họ biết sự thiện chí của mình, rằng bạn thật sự chỉ muốn làm cho chính họ giỏi lên, tốt đẹp hơn mà thôi.",
  category: "FA_NUM",
  active: true
},
{
  number: "2",
  content: "Sứ mệnh 2 của bạn đến với cuộc đời này là để kiến tạo hòa bình, hạnh phúc, và mang bình yên đến cho mọi người. Bạn mang năng lượng rung động mạnh mẽ của tình yêu, của sự hy sinh cho đi và phục vụ. <br>
  Bạn mang năng lực của sự thấu hiểu và kết nối một cách mạnh mẽ với người khác. Bạn sẵn sàng mở lòng cho những người bạn mới cũng như sẵn lòng lắng nghe và  đón nhận những lời chia sẽ và tâm sự của mọi người.",
  advise: "Hãy mạnh dạn sử dụng những năng lực vốn có của bản thân, lắng nghe bằng cả trái tim, chia sẻ chân thành, kết nối mọi người và nâng đỡ tinh thần để tình yêu và sự đóng góp của bạn làm cho xã hội tốt đẹp và bình yên hơn!",
  category: "FA_NUM",
  active: true
},
{
  number: "3",
  content: "Khi bạn mang năng lượng sứ mệnh số 3 bạn đã sẵng sàng sở hữu  những năng lực tiếp thu kiên thức rất nhanh, giàu tri thức, và bạn sãn sàng bộc lộ và lan tỏa những giá trị bản thân tới những người xung quanh một cách dễ dàng.  <br>
  Bạn rất có năng khiếu sử dụng ngôn từ và hoạt động nghệ thuật bởi óc sáng tạo rất phong phú, ý tưởng vô cùng dồi dào. Phù hợp với những mảng công việc như nhà văn, diễn viên, hoạt động nghê thuật.",
  advise: "Hãy luôn giữ tâm thế lạc quan, yêu đời, bởi bạn có thể không nhận ra dòng suối của nguồn năng lượng đó tuôn chảy trong bạn, bạn bộc lộ noa ra trước đám đông và mọi người nhận được những giá trị đó lan tỏa từ bạn  Đó là điều rất tuyệt với trong xã hội ngày nay, hay mạnh dạn và nâng cao trí tuệ hơn nữa để trở thành nguồn cảm hứng của mọi người!",
  category: "FA_NUM",
  active: true
},
{
  number: "4",
  content: "ạn sinh ra với sứ mệnh tạo chỗ dựa vững chắc cho người thân, bạn coi trọng những giá trị truyền thống và với bạn gia đình là quan trọng nhất. Bạn thường chăm lo cho những người thân yêu một cách tốt nhất và với trách nhiệm cao nhất nên họ sẽ luôn cảm thấy yên ổn khi có bạn vũng trãi đứng bên. <br>
  Sứ mệnh của bạn được sắp đặt sẽ phát triển như một “bậc thầy xây dựng” trên con đường đạt được ước mơ, thành công và những mục tiêu dài hạn. Bởi năng lực sẵn có trong bạn là tính kỷ luật và sự kiên trì, chịu áp lực công việc rất lớn và kéo dài.",
  advise: "Kỷ luật là điểm nhấn cực sáng trong con người của bạn. Thiếu kỷ luật không ai có thể thành công. Hãy lan tỏa giá trị của sự kỷ luật theo cách của chính bảo đê kiến tạo lên những công trình vĩ đại phục vụ cho cộng đồng.",
  category:"FA_NUM",
  active: true
},
{
  number: "5",
  content:"Sứ mệnh số 5 của bạn là người mang năng lượng rất sáng tạo đổi mới và tràn đầy sức sống. Nên bạn là người đi cải cách, cải tiến, mở đường, cho những đột phá, tiên phong. Bạn luôn nghĩ ra những con đường mới và không chịu theo bất cứ lối mòn nào đã bước qua.  <br>
  Sứ mệnh của bạn được sắp đặt sẽ thúc đẩy được sự thay đổi thông qua hành động cụ thể mang tính cấp tiến. Năng lực tự nhiên của bạn là sự biến đổi và phi nguyên tắc, bạn không ngại thể hiện sự khác biệt ra ngoài, sự sáng tạo cứ thế được thể hiện thoải mái và tuôn chảy bởi nó hoàn toàn thuộc về bạn",
  advise:"Không phải ai sở hữu con số 5 mạnh mẽ cuồng nhiệt cũng hiểu và biết cách khai thác sức mạnh của nó để đến với thành công vang dội. Hãy dám trải nghiệm, dám nghĩ dám dấn thân để tích lũy nhiều kinh nghiệm sống và rồi chọn cho mình đúng 1 con đường để kiên trì đi theo nó, chắc chắn sẽ có thời điểm thành công của bạn bùng nổ vang dội.",
  category:"FA_NUM",
  active: true
},
{
  number: "6",
  content:"Khi mang năng lượng rung động Sứ mệnh 6 bạn có một năng lượng của tình yêu thương tràn trề, bền bỉ. Bạn có trái tim bao dung và sẵn sàng hi sinh vì người khác. Bạn rất khó từ chối lời đề nghị được giúp đỡ từ bất kỳ ai. <br>
  Số 6 giúp bạn có năng lực thẩm mỹ rất mạnh, bạn nên làm những nghề lên quan đến việc xây dựng vẻ đẹp bên ngoài và cả xây dựng những nét đẹp bên trong như việc tạo dựng lên những mái ấm hạnh phúc",
  advise:"Bạn hãy chú trọng vào việc lan tỏa tình yêu thương bởi đó là sức mạnh thu hút từ con người bạn rất lớn, giúp người khác vừa yêu thương vừa nể trọng bạn. Tuy nhiên đôi lúc nên để những người xung quanh, nhất là con cái mình, hãy để họ được độc lập và tự thực thi các vấn đề của chính họ, sự giúp đỡ là cần thiết nhưng cũng nên đúng thời điểm.",
  category:"FA_NUM",
  active: true
},
{
  number: "7",
  content:"Con số Sứ mệnh 7 mang đến cho bạn rung động manh mẽ của năng lực đào sâu tri thức, điềm tĩnh và quan sát vấn đề ở mọi góc cạnh. Bạn rất tôn trọng tri thức và chỉ tin theo những gì mình đã biết rõ, nên bạn luôn có ý thức ngay từ lúc nhỏ là cần vun bồi tri thức. Bạn có thể được ví như “thư viện sống” bởi kiến thúc phong phú và nhiều đề tài mà bạn theo đuổi. <br>
  Sứ mệnh của bạn trong cuộc sống này là hãy tìm cho mình một triết lý sống, một tư tưởng, để sau đó bạn quan sát cuộc sống, chiêm nghiệm về nó, giải thích hiện tượng, đúc kết thành các quy luật chung của cuộc sống.",
  advise:"Với năng lực hiểu rất sâu những vấn đề cuộc sống, người số 7 luôn có kiến thức và tư duy khác thường. Bạn cần cần băng hơn giữa cuộc sống thực tế và cuộc sống tính thần, bằng cách nào đó hãy đưa những tri thức của mình ra bên ngoài để giúp đỡ và chia sẻ cho nhiều người khác cùng lĩnh hội thì những kiến thức bạn tích cóp được còn được phát triển và ứng dụng nhiều hơn nữa.",
  category:"FA_NUM",
  active: true
},
{
  number: "8",
  content:"Mang năng lượng rung của số 8 Sứ mệnh bạn có một năng lực làm việc và chịu áp lực công việc rất tốt. Bạn chăm chỉ, kiên trì và theo đuổi mục tiêu, luôn quyết tâm cao để đạt được những mục tiêu cuộc sống. <br>
  Số 8 cho bạn sở hữu khả năng quản lý, quản trị rất tốt đồng thời bạn cung có khả năng rất giỏi khi làm kinh doanh. Khi đã bắt đầu vào cuộc bạn luôn nhiệt tình và say mê với công việc, điều đó khiến con đường tới thành công của bạn chắc chắn tới và là kết quả tất yếu, bởi những năng lực trên thuộc về bạn một cách tự nhiên. <br>
  Phải có thành công về vật chất, tiền bạc, và danh vọng.",
  advise:"Trong mọi vấn đề bạn yêu cầu về sự công bằng, tính thực tế rất cao, và luôn khẳng định được sự tự chủ của bản thân, không thích bị ràng buộc nhiều. Tuy nhiên cuộc sống xã hội có rất nhiều vấn đề không thể tách bạch rõ ràng, nên việc của mình cần thấu hiểu con người, bởi khả năng lãnh đạo sẵn có bạn rất có tiềm năng giữ những chức vụ quan trọng trong xã hội thì thu phục nhân tâm nhiều hơn là điều rất cần thiết.",
  category:"FA_NUM",
  active: true
},
{
  number: "9",
  content:"Mang trong mình năng lượng số 9 sứ mệnh bạn như chứa sẵn sự thông minh, trí tuệ và ngập tràn tình yêu thương, nhân hậu và chân ái. Bạn luôn hướng tới sự giúp đỡ mọi người và thậm chí luôn tìm ra người để bạn có thể giúp. Bạn có năng lực cống hiến cho cộng đồng rất cao. <br>
  Sứ mệnh 9 cho bạn năng lực lãnh đạo và thu hút niềm tin tự nhiên của mọi người dành cho bạn, nên bạn cần nhất thiết phải học hỏi để thay đôi bản thân trở thành một tấm gương, một người có tâm và có tầm để càng giúp đỡ được nhiều người hơn nữa.",
  advise:"Những phẩm chất trời phú cho bạn khi sở hữu năng lực Sứ mệnh 9 là rất tuyệt vời, bạn nên sử dụng nó với thực tâm cống hiến cho mọi người và cộng đồng thì năng lượng của bạn mới lan tỏa, bạn sẽ thấy mình lớn mạnh mỗi ngày và góp những giá trị lớn lao cho cuộc sống.",
  category:"FA_NUM",
  active: true
},
{
  number: "11",
  content:"",
  advise:"",
  category:"FA_NUM",
  active: true
},
{
  number: "22",
  content:"",
  advise:"",
  category:"FA_NUM",
  active: true
},
{
  number: "33",
  content:"",
  advise:"",
  category:"FA_NUM",
  active: true
},

#====================
#
# grow up number
{
  number: "1",
  content: "Những năng lực bạn cần chuẩn bị trước để khi vào tuổi trưởng thành bạn sẽ có cơ hội sử dụng chúng nhiều nhất đó chính là khả năng làm thủ lĩnh, dám đứng lên tiên phong và dẫn dắt đội ngũ của mình.",
  advise:  "Hãy học cách lãnh đạo theo hướng thấu hiểu hơn để mọi người cảm thấy hài lòng và đặt niềm tin theo bạn.  <br>
  Tỉnh táo và thận trọng khi ra những quyết định lớn.",
  category: "GR_NUM",
  active: true
},
{
  number: "2",
  content: "Những năng lực bạn cần chuẩn bị trước để khi vào tuổi trưởng thành bạn sẽ có cơ hội sử dụng chúng nhiều nhất đó chính là khả năng lắng nghe, đồng cảm, thấu hiểu và kết nối.",
  advise: "Học cách lắng nghe và đồng cảm để thấu hiểu người khác. <br>
  Tăng cường kết nối với mọi người trong hòa bình và tình yêu thương. <br>
  Vận dụng trực giác của bản thân để đưa ra những quyết định đúng.",
  category: "GR_NUM",
  active: true
},
{
  number: "3",
  content: "Những năng lực bạn cần chuẩn bị trước để khi vào tuổi trưởng thành bạn sẽ có cơ hội sử dụng chúng nhiều nhất đó chính là khả năng truyền đạt tri thức, ngôn từ và khả năng sáng tạo rất phong phú.",
  advise: "Tăng cường kết nối giao lưu với nhiều người để có nhiều mối quan hệ tốt đẹp. <br>
  Sử dụng ngôn từ linh hoạt, sự hài hước của bản thân để giao tiếp và truyền đạt điều mình muốn gửi đến mọi người bằng cách dễ tiếp thu nhất.",
  category: "GR_NUM",
  active: true
},
{
  number: "4",
  content: "Những năng lực bạn cần chuẩn bị trước để khi vào tuổi trưởng thành bạn sẽ có cơ hội sử dụng chúng nhiều nhất đó chính là khả năng tổ chức, lên kế hoạch và quản lý.",
  advise: "Sử dụng năng lực tổ chức, quản lý để có những kế hoạch tốt cho bản thân, gia đình, đội nhóm hoặc công ty của bạn. <br>
  Sử dụng sự phân tích tỉ mỉ chỉ tiết để hạn chế những rủi ro và đưa ra quyết định chính xác hơn.",
  category:"GR_NUM",
  active: true
},
{
  number: "5",
  content:"Những năng lực bạn cần chuẩn bị trước để khi vào tuổi trưởng thành bạn sẽ có cơ hội sử dụng chúng nhiều nhất đó chính là khả năng sáng tạo vô bờ bến, sự mạnh dạn tìm tòi, dám trải nghiệm, dám bùng nổ.",
  advise:"Nên trải nghiệm thật nhiều để phát huy khả năng sáng tạo. <br>
  Hãy phát huy tối đa các giác quan, nhất là quan sát và nghe nói.",
  category:"GR_NUM",
  active: true
},
{
  number: "6",
  content:"Những năng lực bạn cần chuẩn bị trước để khi vào tuổi trưởng thành bạn sẽ có cơ hội sử dụng chúng nhiều nhất đó chính là khả năng Phục vụ, quản trị con người bằng tình yêu thương, tâm tâm tỉ mỉ và bằng con mắt thẩm mĩ để phục vụ cho mọi người.",
  advise:"Trong mọi việc bạn làm cần để cái tâm vào, sử dụng tình yêu thương để quan tâm, chăm sóc người khác. <br>
  Phát huy khả năng thẩm mỹ và sử dụng cái đẹp để phục vụ người khác để cả về hình thức lẫn nội dung.",
  category:"GR_NUM",
  active: true
},
{
  number: "7",
  content:"Những năng lực bạn cần chuẩn bị trước để khi vào tuổi trưởng thành bạn sẽ có cơ hội sử dụng chúng nhiều nhất đó chính là khả năng học hỏi không giới hạn, và khả năng đúc kết những trải nghiệm để ứng dụng cho cuộc sống.",
  advise:"Cần sử dụng thêm khả năng về trực giác của bản thân bởi giai đoạn này năng lực đó rất mạnh trong bạn. <br>
  Cần học hỏi nâng cao, đúc kết trải nghiệm để truyền đạt lại cho người khác",
  category:"GR_NUM",
  active: true
},
{
  number: "8",
  content:"Những năng lực bạn cần chuẩn bị trước để khi vào tuổi trưởng thành bạn sẽ có cơ hội sử dụng chúng nhiều nhất đó chính là khả năng bao quát vấn đề, trở thành người quản trị, điều hành hoặc kinh doanh.",
  advise:"Cần học hỏi và tích lũy kinh nghiệm để phát huy khả năng điều hành, quản trị của bạn từ sớm.
  Với khả năng bao quát vấn đề, trong kinh doanh hãy phân tích những cơ hội tốt để đầu tư sinh lời.",
  category:"GR_NUM",
  active: true
},
{
  number: "9",
  content:"Lãnh đạo, dẫn dắt làm gương <br>
  Thu hút bằng nhân tâm <br>
  Những năng lực bạn cần chuẩn bị trước để khi vào tuổi trưởng thành bạn sẽ có cơ hội sử dụng chúng nhiều nhất đó chính là khả năng thu hút người khác bằng nhân tâm và trí tuệ, dẫn dắt người khác, năng lực lãnh đạo, làm gương cho người khác noi theo.",
  advise:"Hãy trở thành người lãnh đạo, người dẫn dắt có tâm và có tầm, có trí tuệ và tâm sáng. <br>
  Hãy tập trung giỏi một chuyên môn nào đó để thu hút và dẫn dắt người khác",
  category:"GR_NUM",
  active: true
},
{
  number: "11",
  content:"",
  advise:"",
  category:"GR_NUM",
  active: true
},
{
  number: "22",
  content:"",
  advise:"",
  category:"GR_NUM",
  active: true
},
{
  number: "33",
  content:"",
  advise:"",
  category:"GR_NUM",
  active: true
},
]

if NumContent.count == 0
  puts "seeding number content"
  numcontents_attributes.each do |numcontent_attributes|
    numcontent = NumContent.new(numcontent_attributes)
    # user.skip_confirmation!
    numcontent.save! if NumContent.where(number: numcontent_attributes[:number], category: numcontent_attributes[:category]).first.blank?
  end
end

puts "We have #{NumContent.count} NumContent data => done"
