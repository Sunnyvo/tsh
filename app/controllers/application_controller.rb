class ApplicationController < ActionController::Base

  def testpdf
    data = [
      [
        [:font, Rails.root.join("app", "assets", "fonts", "Admiration Pains.ttf")], # set font cho toàn bộ content file
        # [:text_box, "2018", at: [260, 790], size: 10], # điền text "2018" với font size 10 vào vị trí (260, 790)
        # [:text_box, "6", at: [307, 790], size: 10],
        # [:text_box, "20", at: [333, 790], size: 10],
        # [:text_box, "グエン　ドゥック　トゥン", at: [135, 774], size: 10],
        [:text_box, "Sunny Vo", at: [135, 748], size: 20]
        # [:text_box, "1991", at: [120, 701], size: 10],
        # [:text_box, "2", at: [170, 701], size: 10],
        # [:text_box, "31", at: [210, 701], size: 10],
        # [:text_box, "26", at: [285, 701], size: 10],
        # [:stroke_ellipse, [348, 688], 10], # vẽ đường tròn với bán kính 10px ở vị trí (348, 688)
        # [:text_box, "トウキョウト シンジュクク シンジュク ゴチョウメ ニノイチ", at: [135, 673], size: 10],
        # [:text_box, "160-0022", at: [135, 658], size: 10],
        # [:text_box, "東京都新宿区新宿５丁目２ー1", at: [135, 635], size: 18],
        # [:text_box, "0987654321", at: [425, 653], size: 12]
      ],
      [
        # page 2 tạm thời không có nội dung nên truyền vào mảng rỗng
      ]
    ]
    testpdftsh = PdfToPdfService.new("test.pdf", "out.pdf", data).perform
  end
end
