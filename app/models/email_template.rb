class EmailTemplate < ApplicationRecord
  belongs_to :user

  CATEGORY = [
    { name: 'General', value: 'GENERAL' },
    { name: 'send demo', value: 'SEND_DEMO' }
  ]

  def self.send_demo
    EmailTemplate.where(category: 'SEND_DEMO').first
  end

end
