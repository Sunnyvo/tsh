class NumContent < ApplicationRecord
  CATEGORY = [
    { name: 'Chỉ số ngày sinh', value: 'DB_NUM' },
    { name: 'Chỉ số thái độ', value: 'AT_NUM' },
    { name: 'Chỉ số nhân cách', value: 'PE_NUM' },
    { name: 'Chỉ số đường đời', value: 'LP_NUM' },
    { name: 'Chỉ số linh hồn', value: 'SP_NUM' },
    { name: 'Chỉ số sứ mệnh', value: 'FA_NUM' },
    { name: 'Chỉ số trưởng thành', value: 'GR_NUM' }
  ]

  # def self.send_demo
  #   EmailTemplate.where(category: 'SEND_DEMO').first
  # end

  # def self.send_docvi
  #   EmailTemplate.where(category: 'SEND_DOCVI').first
  # end

  # def self.send_full
  #   EmailTemplate.where(category: 'SEND_FULL').first
  # end

end
