class Numerology < ApplicationRecord
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
    return sum_vowels(name.split(" ").last)
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
    return sum_consonants(name.split(" ").last)
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
    return (max_index + 1)
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
    d1 = d2 = d3 = d4 = d5 = d6 = d7 = d8 = d9 = ""
    chs_life_number = day_of_birth.day.to_s + day_of_birth.month.to_s + day_of_birth.year.to_s
    arr_pytago = chs_life_number.split("")
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
  return attitude_number[1]
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
    return sum_characters(m1.to_i + m2[1].to_i)
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
    sum_characters(day_of_birth.day.to_i)
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

  def file_demo
    data = [
      [
        [:font, Rails.root.join("app", "assets", "fonts", "Admiration Pains.ttf")], # set font cho toàn bộ content file
        [],
        [:text_box, "Sunny Vo", at: [500, 748], size: 20]
      ],
      [
        # page 2 tạm thời không có nội dung nên truyền vào mảng rỗng
      ]
    ]
    # testpdftsh = PdfToPdfService.new("test.pdf", "out.pdf", data).perform
    demo.attach(io: File.open("#{Rails.root}/app/assets/images/sample.pdf"), filename: 'demo.pdf')
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

  def file_full

  end

  def testpdf
    data = [
      [
        # page 1 tạm thời không có nội dung nên truyền vào mảng rỗng
      ],
      [
        # [:font, Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")], # set font cho toàn bộ content file
        # [:text_box, "Vo Tan Phu",:color => "FCFCFC", at: [260, 280], size: 15],
        [:formatted_text_box,  [ { :text => name, color: "FCFCFC" },
          ], :at => [270, 276], :width => 200, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => day_of_birth.strftime('%d/%m/%Y'), color: "FCFCFC" },
          ], :at => [270, 253], :width => 200, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => email, color: "FCFCFC" },
          ], :at => [270, 230], :width => 200, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => phone, color: "FCFCFC" },
          ], :at => [270, 207], :width => 200, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
      ],
      [
        # page 3 tạm thời không có nội dung nên truyền vào mảng rỗn2
      ],
      [
        # page 4 tạm thời không có nội dung nên truyền vào mảng rỗn2
      ],
      [
        [:formatted_text_box,  [ { :text => emotion_number.to_s, color: "FCFCFC",size: 30 },
          ], :at => [414, 545], :width => 200, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text =>  personal_number[0] + "/" + personal_number[1], color: "FCFCFC",size: 30 },
          ], :at => [395, 425], :width => 200, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => spirit_number[0] + "/" + spirit_number[1], color: "FCFCFC",size: 30 },
          ], :at => [395, 305], :width => 200, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => fate_number[0] + "/" + fate_number[1], color: "FCFCFC",size: 30 },
          ], :at => [395, 185], :width => 200, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
      ],
      [
        [:formatted_text_box,  [ { :text => birth_day_number[0] + "/" + birth_day_number[1], color: "FCFCFC",size: 30 },
          ], :at => [395, 635], :width => 200, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => attitude_number[0] + "/" + attitude_number[1], color: "FCFCFC",size: 30 },
          ], :at => [395, 515], :width => 200, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => life_number[0] + "/" + life_number[1], color: "FCFCFC",size: 30 },
          ], :at => [395, 395], :width => 200, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => middle_age_number[0] + "/" + middle_age_number[1], color: "FCFCFC",size: 30 },
          ], :at => [395, 275], :width => 200, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => missing_number.join(" "), color: "FCFCFC",size: 30 },
          ], :at => [380, 155], :width => 200, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],

      ],
      [
        # page 7 tạm thời không có nội dung nên truyền vào mảng rong
      ],
      [
        [:formatted_text_box,  [ { :text => name.split(" ").last, color: "FCFCFC",size: 70, align: "center" },
          ], :at => [205, 525], :width => 200, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{first_vowel_fn_to_num}" + "    ", color: "FCFCFC", size: 45 },
          { :text => " " + "#{sum_vowels_fn[1]}" + "    ", color: "FCFCFC", size: 45 },
          { :text => " " + "#{first_cha_first_name_to_num}" + "    ", color: "FCFCFC", size: 45 },
          { :text => " " + "#{sum_consonants_fn[1]}" + "    ", color: "FCFCFC", size: 45 },
          { :text => " " + "#{sum_cons_vowels_fn[1]}" + "    ", color: "FCFCFC", size: 45 },
          ], :at => [107, 385], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
      ],
      [
        [:formatted_text_box,  [ { :text => "#{name_grath[2]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [95, 540], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{name_grath[1]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [95, 410], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{name_grath[0]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [95, 280], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
          [:formatted_text_box,  [ { :text => "#{name_grath[5]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [290, 540], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{name_grath[4]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [290, 410], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{name_grath[3]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [290, 280], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{name_grath[8]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [470, 540], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{name_grath[7]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [470, 410], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{name_grath[6]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [470, 280], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],

      ],
      [
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[2]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [95, 523], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[1]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [95, 393], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[0]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [95, 263], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[5]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [290, 523], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[4]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [290, 393], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[3]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [290, 263], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[8]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [470, 523], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[7]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [470, 393], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{pytago_arrow[6]}" + "    ", color: "FCFCFC", size: 55 },
          ], :at => [470, 263], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
      ],
      [
        [:image, "#{Rails.root}/app/assets/images/number/#{emotion_number.to_s}.png", color: "FCFCFC",:width => 60,
           :at => [267, 450]]
      ],
      [
        [:image, "#{Rails.root}/app/assets/images/number/#{personal_number[1]}.png", color: "FCFCFC",:width => 60,
          :at => [267, 450]]
      ],
      [
        [:image, "#{Rails.root}/app/assets/images/number/#{spirit_number[1]}.png", color: "FCFCFC",:width => 60,
          :at => [267, 450]]
      ],
      [
        [:image, "#{Rails.root}/app/assets/images/number/#{fate_number[1]}.png", color: "FCFCFC",:width => 60,
          :at => [267, 450]]
      ],
      [
        [:image, "#{Rails.root}/app/assets/images/number/#{birth_day_number[1]}.png", color: "FCFCFC",:width => 60,
          :at => [267, 450]]
      ],
      [
        [:image, "#{Rails.root}/app/assets/images/number/#{attitude_number[1]}.png", color: "FCFCFC",:width => 60,
          :at => [267, 450]]
      ],
      [
        [:image, "#{Rails.root}/app/assets/images/number/#{life_number[1]}.png", color: "FCFCFC",:width => 60,
          :at => [267, 450]]
      ],
      [
        [:image, "#{Rails.root}/app/assets/images/number/#{middle_age_number[1]}.png", color: "FCFCFC",:width => 60,
          :at => [267, 450]]
      ], missing_number_data,
      [
        [:formatted_text_box,  [ { :text => "#{month_number[1]}" + "    ", color: "FCFCFC", size: 20 },
          ], :at => [60, 150], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{day_number[1]}" + "    ", color: "FCFCFC", size: 20 },
          ], :at => [290, 150], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{year_number[1]}" + "    ", color: "FCFCFC", size: 20 },
          ], :at => [520, 150], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{m1}" + "    ", color: "FCFCFC", size: 20 },
          ], :at => [175, 215], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{m2[1]}" + "    ", color: "FCFCFC", size: 20 },
          ], :at => [410, 215], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{m3[1]}" + "    ", color: "FCFCFC", size: 20 },
          ], :at => [290, 300], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{m4[1]}" + "    ", color: "FCFCFC", size: 20 },
          ], :at => [290, 460], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],

      ],
      [
        [:image, "#{Rails.root}/app/assets/images/number/#{current_year_number[1]}.png", color: "FCFCFC",:width => 60,
          :at => [267, 450]]
      ],
      [
        # page 23 tạm thời không có nội dung nên truyền vào mảng rỗn2
      ],
      [
        [:formatted_text_box,  [ { :text => "#{natural_suitable_numbers.join("  ")}" + "    ", color: "FCFCFC", size: 20 },
          ], :at => [140, 455], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "||", color: "FCFCFC", size: 20 },
          ], :at => [290, 455], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{suitable_numbers.join("  ")}" + "    ", color: "FCFCFC", size: 20 },
          ], :at => [440, 455], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")],
        [:formatted_text_box,  [ { :text => "#{unsuitable_numbers.join("  ")}" + "    ", color: "FCFCFC", size: 20 },
          ], :at => [240, 250], :width => 400, :height => 100, font: Rails.root.join("app", "assets", "fonts", "SVN-Neusa.ttf")]
      ],
      [
        # page 24 tạm thời không có nội dung nên truyền vào mảng rỗn2
      ],
      [
        # page 25 tạm thời không có nội dung nên truyền vào mảng rỗn2
      ],
      [
        # page 26 tạm thời không có nội dung nên truyền vào mảng rỗn2
      ],
      [
        # page 27 tạm thời không có nội dung nên truyền vào mảng rỗn2
      ],
      [
        [:text_box, "Sunny Vo", at: [200, 748], size: 20]
      ]
    ]

    testpdftsh = PdfToPdfService.new("#{Rails.root}/app/assets/images/sample.pdf", "#{Rails.root}/app/data/out.pdf", data).perform
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
end
