
name = "vo tan phu"
@value_cha = {"a" => 1, "j"  => 1, "s" => 1, "b" => 2, "k" => 2, "t" => 2, "c" => 3, "l" => 3, "u" => 3, "d" => 4, "m" => 4, "v" => 4, "e" => 5, "n" => 5, "w" => 5, "f" => 6, "o" => 6, "x" => 6, "g" => 7, "p" => 7, "y" => 7, "h" => 8, "q" => 8, "z" => 8,"i" => 9,"r" => 9 }
birth="21/01/1992"

  #step 1 nguyen am dau tien cua tu hoac first name
  def first_vowel_fn(name)
    return first_vowel(name.split(" ").last)
  end

  def first_vowel(element)
  return vowels(element).first
  end

  #step 2 tong nguyen am cua tu hoac first name
  def sum_vowels_fn(name)
    return sum_vowels(name.split(" ").last)
  end

  def sum_vowels(element)
    vowels = vowels(element)
    sv = 0
    vowels.each do |v|
      sv += @value_cha[v]
    end
    return sum_characters(sv)
  end

  #step 3 chu cai dau tien cua tu hoac first name
  def first_cha_first_name(name)
    first_name = name.split(" ").last
    first_name.split("").first
  end

  #step 4 tong phu am cua tu hoac first name
  def sum_consonants_fn(name)
    return sum_consonants(name.split(" ").last)
  end

  def sum_consonants(element)
    consonants = consonants(element)
    sv = 0
    consonants.each do |v|
      sv += @value_cha[v]
    end
    return sum_characters(sv)
  end

  #step 5 tong nguyen am va phu am cua tu hoac first name
  def sum_cons_vowels_fn(name)
    first_name = name.split(" ").last
    return  sum_characters(sum_consonants(first_name) + sum_vowels(first_name) )
  end

  #name_grath danh đồ
  def name_grath(name)
    d1 = d2 = d3 = d4 = d5 = d6 = d7 = d8 = d9 = ""
    arr_name =  all_characters(name)
    arr_name.each do |n|
      vc = @value_cha[n]
      case vc
      when 1
        d1 += "1"
      when 2
        d2 += "2"
      when 3
        d3 += "3"
      when 4
        d4 += "4"
      when 5
        d5 += "5"
      when 6
        d6 += "6"
      when 7
        d7 += "7"
      when 8
        d8 += "8"
      when 9
        d9 += "9"
      end
    end
    puts d1
    puts d2
    puts d3
    puts d4
    puts d5
    puts d6
    puts d7
    puts d8
    puts d9
  end

  #chi so nhan cach - tong phu am
  def personal_number(name)
    cons_name = consonants_name(name)
    sc = 0
    cons_name.each do |c|
      sc += @value_cha[c]
    end
    return sum_characters(sc)
  end

  #chi so linh hon - tong nguyen am
  def spirit_number(name)
    vowels_name = vowels_name(name)
    sv = 0
    vowels_name.each do |v|
      sv += @value_cha[v]
    end
    return sum_characters(sv)
  end

  #chi so su menh - tong ky tu
  def fate_number(name)
    chs_name = all_characters(name)
    schs = 0
    chs_name.each do |ch|
      schs += @value_cha[ch]
    end
    return sum_characters(schs)
  end

  #chi so ngay sinh
  def birth_day_number(birth)
    chs_birth_day = birth.split("/").first.split("")
    sbd = 0
    chs_birth_day.each do |ch|
      sbd += ch.to_i
    end
    return sum_characters(sbd)
  end

  #chi so thai do
  def attitude_number(birth)
    chs_birth = birth.split("/")
    attitude_number_groups = chs_birth.first + chs_birth[1]
    chs_attitude_number = attitude_number_groups.split("")
    san = 0
    chs_attitude_number.each do |ch|
      san += ch.to_i
    end
    return sum_characters(san)
  end

  #chi so duong doi
  def life_number(birth)
    chs_life_number = birth.split("/").join("").split("")
    sln = 0
    chs_life_number.each do |ch|
      sln += ch.to_i
    end
    return sum_characters(sln)
  end

  #pytago
  def pytago_arrow(birth)
    d1 = d2 = d3 = d4 = d5 = d6 = d7 = d8 = d9 = ""
    arr_pytago =  chs_life_number = birth.split("/").join("").split("")
    arr_pytago.each do |n|
      nf = n.to_i
      case nf
      when 1
        d1 += "1"
      when 2
        d2 += "2"
      when 3
        d3 += "3"
      when 4
        d4 += "4"
      when 5
        d5 += "5"
      when 6
        d6 += "6"
      when 7
        d7 += "7"
      when 8
        d8 += "8"
      when 9
        d9 += "9"
      end
    end
    puts d1
    puts d2
    puts d3
    puts d4
    puts d5
    puts d6
    puts d7
    puts d8
    puts d9
  end

  # chi so trung nien
  def middle_age_number(name, birth)
    fate_number = fate_number(name).to_s + fate_number(name).to_s
    life_number = life_number(birth).to_s + life_number(birth).to_s
    middle_age_number = sum_characters(fate_number.to_i + life_number.to_i)
  end

  def start_middle_age(birth)
    return 36 - birth_day_number(birth)
  end

  def end_middle_age(birth)
    start_middle_age(birth) + 27
  end

  # chi so thieu
  def missing_number(name, birth)
    d = [false, false, false, false, false, false, false, false, false, false, false]
    array_missing_numbers = [1,2,3,4,5,6,7,8,9]
    array_numbers = []
    array_numbers << spirit_number(name) #linh hon
    array_numbers << personal_number(name) # nhan cach
    array_numbers << fate_number(name) # su menh
    array_numbers << birth_day_number(birth) # ngay sinh
    array_numbers << attitude_number(birth) # thai do
    array_numbers << life_number(birth) # duong doi
    array_numbers << middle_age_number(name, birth) # trung nien
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
    return array_missing_numbers.join(", ")
  end

  # cac moc phat trien cuoc doi
  def m1(birth)
  return attitude_number(birth)
  end

  def m2(birth)
    chs_birth = birth.split("/")
    attitude_number_groups = chs_birth.first + chs_birth.last
    chs_attitude_number = attitude_number_groups.split("")
    san = 0
    chs_attitude_number.each do |ch|
      san += ch.to_i
    end
    return sum_characters(san)
  end

  def m3(birth)
    return sum_characters(m1(birth) + m2(birth))
  end

  def m4(birth)
    chs_birth = birth.split("/")
    attitude_number_groups = chs_birth[1] + chs_birth.last
    chs_attitude_number = attitude_number_groups.split("")
    san = 0
    chs_attitude_number.each do |ch|
      san += ch.to_i
    end
    return sum_characters(san)
  end
  #lay nguyen am cum tu
  def vowels_name(name)
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
      return (arr_vowels - ["y"])
    else
      return arr_vowels
    end
  end

  #lay phu am cum tu
  def consonants_name(name)
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

  def sum_characters(number)
      flag = "no";
      svfnfm = 0;
      sotachra = 0;
      while flag == "no"
        while (number!=0)
          sotachra = number % 10;
          svfnfm += sotachra;
          number /= 10;
        end
        if svfnfm < 10
          flag = "yes"
        else
          number = svfnfm
          svfnfm = 0;
          sotachra = 0;
        end
      end
      return svfnfm
  end

  def all_characters(name)
    return name.split(" ").join("").split("")
  end
