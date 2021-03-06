class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # before_action :authenticate_user!
  # belongs_to :supplier
  has_many :numerologies
  has_many :email_templates
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  CATEGORY = [
    { name: 'General', value: 'GENERAL' },
    { name: 'bản rút gọn', value: 'SEND_DEMO' }
  ]

  def self.send_demo
    EmailTemplate.where(category: 'SEND_DEMO').first
  end
end
