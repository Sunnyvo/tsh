module Suitable
  def natural_suitable
    return {"1" => [1, 5, 7],
            "2" => [2, 4, 8],
            "3" => [3, 6, 9],
            "4" => [2, 4, 8],
            "5" => [1, 5, 7],
            "6" => [3, 6, 9],
            "7" => [1, 5, 7],
            "8" => [2, 4, 8],
            "9" => [3, 6, 9]
          }
  end

  def suitable
    return {"1" => [2, 3, 9],
      "2" => [1, 3, 6, 9],
      "3" => [1, 2, 5],
      "4" => [6, 7],
      "5" => [3, 9],
      "6" => [2, 4, 8],
      "7" => [4],
      "8" => [6],
      "9" => [1, 2, 5]
    }
  end

  def unsuitable
    return {"1" => [4, 6],
      "2" => [5, 7],
      "3" => [4, 7, 8],
      "4" => [1, 3, 5, 9],
      "5" => [2, 4, 6],
      "6" => [1, 5, 7],
      "7" => [2, 3 , 6, 8, 9],
      "8" => [3, 7, 9],
      "9" => [4, 7, 8]
    }
  end

  def neutral
    return {"1" => [8],
      "2" => [],
      "3" => [],
      "4" => [],
      "5" => [8],
      "6" => [],
      "7" => [],
      "8" => [1, 5],
      "9" => []
    }
  end

  def value_cha
    return {"a" => 1, "j"  => 1, "s" => 1, "b" => 2, "k" => 2, "t" => 2, "c" => 3, "l" => 3, "u" => 3, "d" => 4, "m" => 4, "v" => 4, "e" => 5, "n" => 5, "w" => 5, "f" => 6, "o" => 6, "x" => 6, "g" => 7, "p" => 7, "y" => 7, "h" => 8, "q" => 8, "z" => 8,"i" => 9,"r" => 9 }
  end

  def value_day_birth_color
    return {
      "1" => "Màu vàng các loại, bao gồm cả cam và nâu vàng, hổ phách, kim cương, topaz",
      "2" => "Màu green, kem và trắng, ngọc trai, đá mặt trăng, ngọc bích, ngọc mắt mèo",
      "3" => "Màu tím, thạch anh tím",
      "4" => "Màu xám, saphia",
      "5" => "Màu sáng, lấp lánh; kim cương, đá lấp lánh",
      "6" => "Màu xanh blue, ngọc lục bảo, ngọc lam, đá màu xanh (đã kiểm tra, ngọc lục bảo vẫn hợp nhé)",
      "7" => "Màu xám bồ câu, đá mặt trăng, ngọc trai, ngọc mắt mèo",
      "8" => "Màu xám đậm, lam đậm, tía, đen; các loại đá màu sậm: thạch anh tím, rubi xỉn màu, ngọc trai
      đen, kim cương đen, shapphia sẫm",
      "9" => "Màu hồng, đỏ, ruby, đá màu đỏ",
      }
  end
end
