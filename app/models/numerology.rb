class Numerology < ApplicationRecord
  before_create :down_case_name
  has_one_attached :demo
  belongs_to :user
  include Suitable
  #step 1 nguyen am dau tien cua tu hoac first name
  def first_vowel_fn_to_num
    return value_cha[first_vowel_fn]
  end

  def first_vowel_fn
    return first_vowel(name.split(" ").last)
  end

  def first_vowel(element)
  return vowels(element).first
  end

  #step 2 tong nguyen am cua tu hoac first name
  def sum_vowels_fn
    first_name = name.split(" ").last
    return "" if vowels(first_name).count == 1
    sum_v = sum_vowels(first_name)
    return sum_v[1]
  end

  def sum_vowels(element)
    vowels = vowels(element)
    sv = 0
    vowels.each do |v|
      sv += value_cha[v]
    end
    return sum_characters(sv)
  end

  #step 3 chu cai dau tien cua tu hoac first name
  def first_cha_first_name_to_num
    return value_cha[first_cha_first_name]
  end

  def first_cha_first_name
    first_name = name.split(" ").last
    first_name.split("").first
  end

  #step 4 tong phu am cua tu hoac first name
  def sum_consonants_fn
    first_name = name.split(" ").last
    return "" if consonants(first_name).count == 1
    sum_c = sum_consonants(first_name)
    return sum_c[1]
  end

  def sum_consonants(element)
    consonants = consonants(element)
    sv = 0
    consonants.each do |v|
      sv += value_cha[v]
    end
    return sum_characters(sv)
  end

  #step 5 tong nguyen am va phu am cua tu hoac first name
  def sum_cons_vowels_fn
    first_name = name.split(" ").last
    return  sum_characters(sum_consonants(first_name).last.to_i + sum_vowels(first_name).last.to_i)
  end

  #name_grath danh đồ
  def name_grath
    arr_name =  all_characters
    array_number = ["","","","","","","","",""]
    arr_name.each do |n|
      vc = value_cha[n]
      array_number[vc-1] += "#{(vc).to_s}"
    end

    array_number
  end

  #chi so noi cam
  #name_grath danh đồ
  def emotion_number
    arr_name =  all_characters
    array_number = [0,0,0,0,0,0,0,0,0]
    arr_name.each do |n|
      vc = value_cha[n]
      array_number[vc-1] += 1
    end
    max_index = array_number.each_with_index.max[1]
    max_number = array_number.max
    # return "1" if max_number == 1
    return (max_index + 1).to_s
  end

  #chi so nhan cach - tong phu am
  def personal_number
    sc = 0
    consonants_name.each do |c|
      sc += value_cha[c]
    end
    return sum_characters(sc)
  end

  #chi so linh hon - tong nguyen am
  def spirit_number
    sv = 0
    vowels_name.each do |v|
      sv += value_cha[v]
    end
    return sum_characters(sv)
  end

  #chi so su menh - tong ky tu
  def fate_number
    schs = 0
    all_characters.each do |ch|
      schs += value_cha[ch]
    end
    return sum_characters(schs)
  end

  #chi so ngay sinh
  def birth_day_number
    chs_birth_day = day_of_birth.day.to_s.split("")
    sbd = 0
    chs_birth_day.each do |ch|
      sbd += ch.to_i
    end
    return sum_characters(sbd)
  end

  #chi so thai do
  def attitude_number
    attitude_number_groups = day_of_birth.day.to_s + day_of_birth.month.to_s
    chs_attitude_number = attitude_number_groups.split("")
    san = 0
    chs_attitude_number.each do |ch|
      san += ch.to_i
    end
    return sum_characters(san)
  end

  #chi so duong doi
  def life_number
    chs_life_number = day_of_birth.day.to_s + day_of_birth.month.to_s + day_of_birth.year.to_s
    chs_life_number = chs_life_number.split("")
    sln = 0
    chs_life_number.each do |ch|
      sln += ch.to_i
    end
    return sum_characters(sln)
  end

  #pytago
  def pytago_arrow
    chs_life_number = day_of_birth.day.to_s + day_of_birth.month.to_s + day_of_birth.year.to_s
    arr_pytago = chs_life_number.split("")
    arr_pytago = arr_pytago - ["0"]
    array_number = ["","","","","","","","",""]
    arr_pytago.each do |p|
      array_number[p.to_i - 1] += "#{p}"
    end
    array_number
  end

  # chi so trung nien
  def middle_age_number
    return sum_characters(fate_number[0].to_i + life_number[0].to_i)
  end

  def start_middle_age
    return 36 - birth_day_number
  end

  def end_middle_age
    start_middle_age + 27
  end

  # chi so thieu
  def missing_number
    d = [false, false, false, false, false, false, false, false, false, false, false]
    array_missing_numbers = [1,2,3,4,5,6,7,8,9]
    array_numbers = []
    array_numbers += fate_number[0].split("") + [fate_number[1]] # su menh
    array_numbers += spirit_number[0].split("") + [spirit_number[1]] #linh hon
    array_numbers += personal_number[0].split("") + [personal_number[1]] # nhan cach
    array_numbers += [attitude_number[1]] # thai do
    array_numbers += [birth_day_number[1]] # ngay sinh
    array_numbers += life_number[0].split("") + [life_number[1]] # duong doi
    array_numbers += middle_age_number[0].split("") + [middle_age_number[1]] # trung nien
    array_numbers.each do |n|
      nf = n.to_i
      case nf
      when 1
        d[0] = true
        array_missing_numbers -= [nf]
      when 2
        d[1] = true
        array_missing_numbers -= [nf]
      when 3
        d[2] = true
        array_missing_numbers -= [nf]
      when 4
        d[3] = true
        array_missing_numbers -= [nf]
      when 5
        d[4] = true
        array_missing_numbers -= [nf]
      when 6
        d[5] = true
        array_missing_numbers -= [nf]
      when 7
        d[6] = true
        array_missing_numbers -= [nf]
      when 8
        d[7] = true
        array_missing_numbers -= [nf]
      when 9
        d[8] = true
        array_missing_numbers -= [nf]
      end
    end
    return array_missing_numbers
  end


  def all_numerologies
    puts "chi so linh hon: #{spirit_number}" #linh hon
    puts "chi so nhan cach: #{personal_number}" # nhan cach
    puts "chi so su menh: #{fate_number}" # su menh
    puts "chi so ngay sinh: #{birth_day_number}"  # ngay sinh
    puts "chi so thai do: #{attitude_number}" # thai do
    puts "chi so duong doi: #{life_number}"  # duong doi
    puts "chi so trung nien #{middle_age_number}"  # trung nien
    puts "mui ten pytago: #{pytago_arrow}"
    puts "danh do: #{name_grath}"
    puts "chi so thieu: #{missing_number.join(", ")}"
  end

  # cac moc phat trien cuoc doi
  def m1
  return attitude_number
  end

  def m2
    attitude_number_groups = day_of_birth.day.to_s + day_of_birth.year.to_s
    chs_attitude_number = attitude_number_groups.split("")
    san = 0
    chs_attitude_number.each do |ch|
      san += ch.to_i
    end
    return sum_characters(san)
  end

  def m3
    return sum_characters(m1[1].to_i + m2[1].to_i)
  end

  def m4
    attitude_number_groups = day_of_birth.month.to_s + day_of_birth.year.to_s
    chs_attitude_number = attitude_number_groups.split("")
    san = 0
    chs_attitude_number.each do |ch|
      san += ch.to_i
    end
    return sum_characters(san)
  end
  #lay nguyen am cum tu
  def vowels_name
    name_elements = name.split(" ")
    vovels =[]
    name_elements.each do |e|
      vovels += vowels(e)
    end
    return vovels
  end

  #lay nguyen am thanh phan
  def vowels(element)
    element = element.tr("^aeiouy", "")
    arr_vowels = element.split("")
    if (arr_vowels.include?"y") && (arr_vowels.length > 1)
      arr_vowels = arr_vowels - ["y"]
    end
    return arr_vowels
  end

  #lay phu am cum tu
  def consonants_name
    name_elements = name.split(" ")
    consonants =[]
    name_elements.each do |e|
      consonants += consonants(e)
    end
    return consonants
  end

  #lay phu am tung tu
  def consonants(element)
    if is_y_consonants(element)
      element = element.tr("aeiou", "")
    else
      element = element.tr("aeiouy","")
    end
    return element.split("")
  end

  #co phai nguyen am
  def is_y_consonants(element)
    element = element.tr("^aeiouy", "")
    arr_consonants = element.split("")
  return (((arr_consonants.include?"y") && (arr_consonants.length > 1)) ? true : false)
  end
  # thang sinh
  def month_number
    sum_characters(day_of_birth.month.to_i)
  end

  def day_number
    sum_characters(day_of_birth.day.to_i)
  end

  def year_number
    sum_characters(day_of_birth.year.to_i)
  end

  def sum_characters(number)
      flag = "no"
      svfnfm = 0
      sotachra = 0
      pre_number = 0
      while flag == "no"
        pre_number = number
        while (number!=0)
          sotachra = number % 10
          svfnfm += sotachra
          number /= 10
        end
        if svfnfm < 10
          flag = "yes"
        else
          number = svfnfm
          svfnfm = 0
          sotachra = 0
        end
      end
      data = [pre_number.to_s,svfnfm.to_s]
      return data
  end

  def all_characters
    return name.split(" ").join("").split("")
  end

  def all_characters_first_name
    return name.split(" ").last.join("").split("")
  end

  def all_characters_first_name_number
    array_number = []
    arr_name.each do |n|
      array_number += [value_cha[n]]
      return array_number.join()
    end
  end

  def current_year_number
    return sum_characters(sum_characters(Date.current.year).last.to_i + attitude_number[1].to_i)
  end

  def natural_suitable_numbers
    natural_suitable[life_number[1]]
  end

  def suitable_numbers
    suitable[life_number[1]]
  end

  def neutral_numbers
    neutral[life_number[1]]
  end

  def unsuitable_numbers
    unsuitable[life_number[1]]
  end

def attach_pdf_demo
    data = [
      [
        # page 1 tạm thời không có nội dung nên truyền vào mảng rỗng
      ],
      [
        # [:font, Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")], # set font cho toàn bộ content file
        # [:text_box, "Vo Tan Phu",:color => "FCFCFC", at: [260, 280], size: 15],
        [:formatted_text_box,  [ { :text => name, size:14, color: "FCFCFC", font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Regular.ttf")},
          ], :at => [270, 292], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => day_of_birth.strftime('%d/%m/%Y'), size:14,color: "FCFCFC", font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Regular.ttf") },
          ], :at => [270, 267], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => email, color: "FCFCFC", size:14, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Regular.ttf") },
          ], :at => [270, 244], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => phone, color: "FCFCFC", size:14, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Regular.ttf") },
          ], :at => [270, 221], :width => 200, :height => 100],
      ],
      [
        # page 3 tạm thời không có nội dung nên truyền vào mảng rỗn2
      ],
      [
        # page 4 tạm thời không có nội dung nên truyền vào mảng rỗn2
      ],
      [
        [:formatted_text_box,  [ { :text => emotion_number, color: "FCFCFC", size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 626], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text =>   birth_day_number[1], color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 562], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text =>  personal_number[1], color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 498], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => attitude_number[1], color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 434], :width => 200, :height => 100],
          [:formatted_text_box,  [ { :text => spirit_number[1], color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 370], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => life_number[1], color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 308], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => fate_number[1], color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 246], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => middle_age_number[1], color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 184], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => missing_number.join(" "), color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 122], :width => 200, :height => 100],
      ],
      [
      ],
      [
        # page 7 tạm thời không có nội dung nên truyền vào mảng rong
      ],
      [
        # page 27 tạm thời không có nội dung nên truyền vào mảng rong
      ]
    ]
      testpdftsh = PdfToPdfService.new("#{Rails.root}/app/assets/images/demo.pdf", "#{Rails.root}/app/data/demo.pdf", data).perform
  end

  def missing_number_data
    return if missing_number.count == 0
    data = []
    if missing_number.count == 1
      data1 = [:image, "#{Rails.root}/app/assets/images/number/#{missing_number[0]}.png", color: "FCFCFC",:width => 60,
        :at => [267, 450]]
      data = [data1]
    end
    if missing_number.count == 2
      data1 = [:image, "#{Rails.root}/app/assets/images/number/#{missing_number[0]}.png", color: "FCFCFC",:width => 60,
        :at => [217, 450]]
      data2 = [:image, "#{Rails.root}/app/assets/images/number/#{missing_number[1]}.png", color: "FCFCFC",:width => 60,
        :at => [327, 450]]
      return [data1, data2]
    end

    if missing_number.count == 3
      data1 = [:image, "#{Rails.root}/app/assets/images/number/#{missing_number[0]}.png", color: "FCFCFC",:width => 60,
        :at => [177, 450]]
      data2 = [:image, "#{Rails.root}/app/assets/images/number/#{missing_number[1]}.png", color: "FCFCFC",:width => 60,
        :at => [257, 450]]
      data3 = [:image, "#{Rails.root}/app/assets/images/number/#{missing_number[2]}.png", color: "FCFCFC",:width => 60,
        :at => [337, 450]]
      return [data1 , data2 , data3]
    end

    if missing_number.count == 4
      data1 = [:image, "#{Rails.root}/app/assets/images/number/#{missing_number[0]}.png", color: "FCFCFC",:width => 60,
        :at => [137, 450]]
      data2 = [:image, "#{Rails.root}/app/assets/images/number/#{missing_number[1]}.png", color: "FCFCFC",:width => 60,
        :at => [227, 450]]
      data3 = [:image, "#{Rails.root}/app/assets/images/number/#{missing_number[2]}.png", color: "FCFCFC",:width => 60,
        :at => [317, 450]]
      data4 = [:image, "#{Rails.root}/app/assets/images/number/#{missing_number[3]}.png", color: "FCFCFC",:width => 60,
        :at => [407, 450]]
      return [data1 , data2 , data3, data4]
    end

    data
  end

  def attach_pdf_full
    data = [
      [
        # page 1 tạm thời không có nội dung nên truyền vào mảng rỗng
      ],
      [
        # [:font, Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")], # set font cho toàn bộ content file
        # [:text_box, "Vo Tan Phu",:color => "FCFCFC", at: [260, 280], size: 15],
        [:formatted_text_box,  [ { :text => name, size:14, color: "FCFCFC", font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Regular.ttf")},
          ], :at => [270, 292], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => day_of_birth.strftime('%d/%m/%Y'), size:14,color: "FCFCFC", font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Regular.ttf") },
          ], :at => [270, 267], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => email, color: "FCFCFC", size:14, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Regular.ttf") },
          ], :at => [270, 244], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => phone, color: "FCFCFC", size:14, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Regular.ttf") },
          ], :at => [270, 221], :width => 200, :height => 100],
      ],
      [
        # page 3 tạm thời không có nội dung nên truyền vào mảng rỗn2
      ],
      [
        # page 4 tạm thời không có nội dung nên truyền vào mảng rỗn2
      ],
      [
        [:formatted_text_box,  [ { :text => emotion_number, color: "FCFCFC", size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 626], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text =>   birth_day_number[1], color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 562], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text =>  personal_number[1], color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 498], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => attitude_number[1], color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 434], :width => 200, :height => 100],
          [:formatted_text_box,  [ { :text => spirit_number[1], color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 370], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => life_number[1], color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 308], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => fate_number[1], color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 246], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => middle_age_number[1], color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 184], :width => 200, :height => 100],
        [:formatted_text_box,  [ { :text => missing_number.join(" "), color: "FCFCFC",size: 30, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [310, 122], :width => 200, :height => 100],
      ],
      [
      ],
      [
        # page 7 tạm thời không có nội dung nên truyền vào mảng rong
      ],
      [
        [:formatted_text_box,  [{ :text => name.split(" ").last.upcase.split("").join(" "), color: "FCFCFC",size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Regular.ttf")},
          ], :at => [100, 625], :width => 400, :height => 100, :align => :center],
        [:formatted_text_box,  [{ :text => "#{first_vowel_fn_to_num}" + "    ", color: "FCFCFC", size: 48, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [107, 401], :width => 400, :height => 100],
        [:formatted_text_box,  [{ :text => " " + "#{sum_vowels_fn}" + "    ", color: "FCFCFC", size: 48, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [196, 401], :width => 400, :height => 100],
        [:formatted_text_box,  [{ :text => " " + "#{first_cha_first_name_to_num}" + "    ", color: "FCFCFC", size: 48, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [285, 401], :width => 400, :height => 100],
        [:formatted_text_box,  [{ :text => " " + "#{sum_consonants_fn}" + "    ", color: "FCFCFC", size: 48, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [374, 401], :width => 400, :height => 100],
        [:formatted_text_box,  [{ :text => " " + "#{sum_cons_vowels_fn[1]}" + "    ", color: "FCFCFC", size: 48, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [461, 401], :width => 400, :height => 100],
      ],
      [
        [:formatted_text_box,  [ { :text => "#{name_grath[2]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [3, 571], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{name_grath[1]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [3, 441], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{name_grath[0]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [3, 311], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{name_grath[5]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [212, 571], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{name_grath[4]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [212, 441], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{name_grath[3]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [212, 311], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{name_grath[8]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [370, 571], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{name_grath[7]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [370, 441], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{name_grath[6]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [370, 311], :width => 170, :height => 100, :align => :right],

      ],
      [
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[2]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [3, 571], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[1]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [3, 441], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[0]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [3, 311], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[5]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [212, 571], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[4]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [212, 441], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[3]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [212, 311], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[8]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [370, 571], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[7]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [370, 441], :width => 170, :height => 100, :align => :right],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[6]}" + "    ", color: "FCFCFC", size: 60, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-BlackItalic.ttf")},
          ], :at => [370, 311], :width => 170, :height => 100, :align => :right],

      ],
      [
        [:formatted_text_box,  [ { :text => "#{emotion_number}" + "    ", color: "FCFCFC", size: 200, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Bold.ttf")},
          ], :at => [263, 560], :width => 400, :height => 400]
      ],
      [
        [:formatted_text_box,  [ { :text => "#{personal_number[1]}" + "    ", color: "FCFCFC", size: 200, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Bold.ttf")},
          ], :at => [263, 560], :width => 400, :height => 400]
      ],
      [
        [:formatted_text_box,  [ { :text => "#{spirit_number[1]}" + "    ", color: "FCFCFC", size: 200, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Bold.ttf")},
          ], :at => [263, 560], :width => 400, :height => 400]
      ],
      [
        [:formatted_text_box,  [ { :text => "#{fate_number[1]}" + "    ", color: "FCFCFC", size: 200, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Bold.ttf")},
          ], :at => [263, 560], :width => 400, :height => 400]
      ],
      [
        [:formatted_text_box,  [ { :text => "#{birth_day_number[1]}" + "    ", color: "FCFCFC", size: 200, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Bold.ttf")},
          ], :at => [263, 560], :width => 400, :height => 400]
      ],
      [
        [:formatted_text_box,  [ { :text => "#{attitude_number[1]}" + "    ", color: "FCFCFC", size: 200, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Bold.ttf")},
          ], :at => [263, 560], :width => 400, :height => 400]
      ],
      [
        [:formatted_text_box,  [ { :text => "#{life_number[1]}" + "    ", color: "FCFCFC", size: 200, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Bold.ttf")},
          ], :at => [263, 560], :width => 400, :height => 400]
      ],
      [
        [:formatted_text_box,  [ { :text => "#{middle_age_number[1]}" + "    ", color: "FCFCFC", size: 200, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Bold.ttf")},
          ], :at => [263, 560], :width => 400, :height => 400]
      ],
      [
      [:formatted_text_box,  [ { :text => "#{birth_day_number[0]}" + "/" + "#{birth_day_number[1]}", color: "FCFCFC", size: 14, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
        ], :at => [128, 393], :width => 45, :height => 100, :align => :center],
      [:formatted_text_box,  [ { :text => "#{attitude_number[0]}" + "/" + "#{attitude_number[1]}", color: "FCFCFC", size: 14, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
        ], :at => [128, 303], :width => 45, :height => 100, :align => :center],
      [:formatted_text_box,  [ { :text => "#{middle_age_number[0]}" + "/" + "#{middle_age_number[1]}", color: "FCFCFC", size: 14, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
        ], :at => [401, 303], :width => 45, :height => 100, :align => :center],
      [:formatted_text_box,  [ { :text => "#{life_number[0]}" + "/" + "#{life_number[1]}", color: "FCFCFC", size: 14, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
        ], :at => [401, 393], :width => 45, :height => 100, :align => :center],
      [:formatted_text_box,  [ { :text => "#{fate_number[0]}" + "/" + "#{fate_number[1]}", color: "FCFCFC", size: 14, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
        ], :at => [350, 463], :width => 45, :height => 100, :align => :center],
      [:formatted_text_box,  [ { :text => "#{spirit_number[0]}" + "/" + "#{spirit_number[1]}", color: "FCFCFC", size: 14, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
        ], :at => [179, 463], :width => 45, :height => 100, :align => :center],
      [:formatted_text_box,  [ { :text => "#{personal_number[0]}" + "/" + "#{personal_number[1]}", color: "FCFCFC", size: 14, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
        ], :at => [266, 490], :width => 45, :height => 100, :align => :center],
      [:formatted_text_box,  [ { :text => "#{missing_number.join(", ")}" + "    ", color: "FCFCFC", size: "#{missing_number.count > 3 ? 20 : 30}".to_i, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
        ], :at => [244, 358], :width => 90, :height => 100, :align => :center],
      ],
      [
        [:formatted_text_box,  [ { :text => "#{month_number[1]}" + "    ", color: "FCFCFC", size: 20, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [60, 150], :width => 400, :height => 100],
        [:formatted_text_box,  [ { :text => "#{day_number[1]}" + "    ", color: "FCFCFC", size: 20, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [290, 150], :width => 400, :height => 100],
        [:formatted_text_box,  [ { :text => "#{year_number[1]}" + "    ", color: "FCFCFC", size: 20, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [520, 150], :width => 400, :height => 100],
        [:formatted_text_box,  [ { :text => "#{(m1[0] == "11" || m1[0] == "22" || m1[0] == "10") ? m1[0] : m1[1]}" + "    ", color: "FCFCFC", size: 20, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [175, 255], :width => 400, :height => 100],
        [:formatted_text_box,  [ { :text => "#{(m2[0] == "11" || m2[0] == "22" || m2[0] == "10") ? m2[0] : m2[1]}" + "    ", color: "FCFCFC", size: 20, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [410, 255], :width => 400, :height => 100],
        [:formatted_text_box,  [ { :text => "tuổi #{36 - life_number[1].to_i}" + "    ", color: "FCFCFC", size: 20, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [150, 215], :width => 400, :height => 100],
        [:formatted_text_box,  [ { :text => "tuổi #{36 - life_number[1].to_i + 9 }" + "    ", color: "FCFCFC", size: 20, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [385, 215], :width => 400, :height => 100],
        [:formatted_text_box,  [ { :text => "#{(m3[0] == "11" || m3[0] == "22" || m3[0] == "10") ? m3[0] : m3[1]}" + "    ", color: "FCFCFC", size: 20, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [290, 310], :width => 400, :height => 100],
        [:formatted_text_box,  [ { :text => "tuổi #{36 - life_number[1].to_i + 18 }" + "    ", color: "FCFCFC", size: 20, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [267, 270], :width => 400, :height => 100],
        [:formatted_text_box,  [ { :text => "#{(m4[0] == "11" || m4[0] == "22" || m4[0] == "10") ? m4[0] : m4[1]}" + "    ", color: "FCFCFC", size: 20, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [290, 460], :width => 400, :height => 100],
        [:formatted_text_box,  [ { :text => "tuổi #{36 - life_number[1].to_i + 27 }" + "    ", color: "FCFCFC", size: 20, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [267, 415], :width => 400, :height => 100],

      ],
      [
        [:formatted_text_box,  [ { :text => "#{current_year_number[1]}" + "    ", color: "FCFCFC", size: 200, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-Bold.ttf")},
          ], :at => [263, 560], :width => 400, :height => 400]
      ],
      [
        [:formatted_text_box,  [ { :text => "#{value_day_birth_color[birth_day_number[1]]}", color: "FCFCFC", size: 14, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
          ], :at => [30, 165], :width => 520, :height => 100, align: :center]
      ],
      [
        [:formatted_text_box,  [ { :text => "#{natural_suitable_numbers.join(" ")}", color: "ff3352", size: 48, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa Bold.ttf")},
          ], :at => [227, 505], :width => 150, :height => 100, align: :center],
        [:formatted_text_box,  [ { :text => "#{unsuitable_numbers.join(" ")}", color: "ff3352", size: 48, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa Bold.ttf")},
          ], :at => [227, 245], :width => 150, :height => 100, align: :center]
      ], crush.nil? ? [] : matching_data,
      [
        # page 25 tạm thời không có nội dung nên truyền vào mảng rỗn2
      ],
      [
        # page 26 tạm thời không có nội dung nên truyền vào mảng rỗn2
      ],
      [
        # page 27 tạm thời không có nội dung nên truyền vào mảng rỗn2
      ]
    ]

    testpdftsh = PdfToPdfService.new("#{Rails.root}/app/assets/images/full.pdf", "#{Rails.root}/app/data/full.pdf", data).perform
  end

  def matching_love
    cr = Numerology.new(name: name2, day_of_birth: day_of_birth2)
    hearts_array =[]
    arr_ur_nums = [personal_number[1], spirit_number[1], fate_number[1], birth_day_number[1], attitude_number[1], life_number[1]]
    arr_cr_nums = [cr.personal_number[1], cr.spirit_number[1], cr.fate_number[1], cr.birth_day_number[1], cr.attitude_number[1], cr.life_number[1]]
    arr_ur_nums.each_with_index do |n, i|
      puts "u:#{n}"
      puts "cr:#{arr_cr_nums[i]}"
      puts "i:#{i}"
      hearts_array << "2" if natural_suitable[n].include?(arr_cr_nums[i])
      hearts_array << "1" if suitable[n].include?(arr_cr_nums[i])
      hearts_array << "-1" if unsuitable[n].include?(arr_cr_nums[i])
      hearts_array << "0" if neutral[n].include?(arr_cr_nums[i])
      puts "hearts_array:#{hearts_array}"
    end
    return hearts_array.reverse
  end

  def crush
    return nil if (name2 == "" || name2 == nil)
    return Numerology.new(name: name2, day_of_birth: day_of_birth2)
  end

  def crush_info
    cr = Numerology.new(name: name2, day_of_birth: day_of_birth2)
    [cr.life_number[1], cr.attitude_number[1], cr.birth_day_number[1], cr.fate_number[1], cr.spirit_number[1], cr.personal_number[1]]
  end

  def your_info
    [life_number[1], attitude_number[1], birth_day_number[1], fate_number[1], spirit_number[1], personal_number[1]]
  end

  def matching_data
    #195 + 110
    #280 + 47
    hearts_array = matching_love
    return nil if crush == nil
    data = []
    your_info.each_with_index do |info, i|
      data <<  [:formatted_text_box,  [ { :text => "#{info}" + "    ", color: "FCFCFC", size: 18, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
        ], :at => [195,(280 + i * 47)], :width => 100, :height => 50, align: :center]
      data <<  [:formatted_text_box,  [ { :text => "#{crush_info[i]}" + "    ", color: "FCFCFC", size: 18, font: Rails.root.join("app", "assets", "fonts", "PlayfairDisplay-SemiBoldItalic.ttf")},
        ], :at => [415,(280 + i * 47)], :width => 100, :height => 50, align: :center]
      if hearts_array[i] == "2"
        data << [:image, "#{Rails.root}/app/assets/images/heart/1.png", :width => 20,
          :at => [330, (275 + i * 47)]]
        data << [:image, "#{Rails.root}/app/assets/images/heart/1.png", :width => 20,
          :at => [360, (275 + i * 47)]]
      end

      data << [:image, "#{Rails.root}/app/assets/images/heart/1.png", :width => 20,
        :at => [345, (275 + i * 47)]] if hearts_array[i] == "1"
      data << [:image, "#{Rails.root}/app/assets/images/heart/2.png", :width => 20,
          :at => [345, (275 + i * 47)]] if hearts_array[i] == "-1"
    end
    data
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      numerology = find_by_id(row["id"]) || new
      numerology.attributes = row.to_hash.slice(*row.to_hash.keys)
      numerology["user_id"] = User.where(email: "tsh@gmail.com").first.id
      numerology.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  private
    def down_case_name
      self.name.downcase!
      if self.name2 != nil
        self.name2.downcase!
      end
    end
end
