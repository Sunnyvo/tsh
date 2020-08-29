class EmailTemplate < ApplicationRecord
  belongs_to :user

  CATEGORY = [
    { name: 'General', value: 'GENERAL' },
    { name: 'send docvi', value: 'SEND_DOCVI' },
    { name: 'send demo', value: 'SEND_DEMO' },
    { name: 'send FULL', value: 'SEND_FULL' }
  ]

  def self.send_demo
    EmailTemplate.where(category: 'SEND_DEMO').first
  end

  def self.send_docvi
    EmailTemplate.where(category: 'SEND_DOCVI').first
  end

  def self.send_full
    EmailTemplate.where(category: 'SEND_FULL').first
  end

end
