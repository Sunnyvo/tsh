class EmailTemplate < ApplicationRecord
  belongs_to :user

  CATEGORY = [
    { name: 'General', value: 'GENERAL' },
    { name: 'send demo', value: 'SEND_DEMO' },
    { name: 'send demo', value: 'SEND_FULL' }
  ]

  def self.send_demo
    EmailTemplate.where(category: 'SEND_DEMO').first
  end

  def self.send_full
    EmailTemplate.where(category: 'SEND_FULL').first
  end

end
