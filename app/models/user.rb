class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # before_action :authenticate_user!
  # belongs_to :supplier
  has_many :numerologies
  has_many :email_templates

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLE = [
    {
      name: 'super admin', value: 'ADMINV2'
    }
  ]
  
  CATEGORY = [
    { name: 'General', value: 'GENERAL' },
    { name: 'bản rút gọn', value: 'SEND_DEMO' },
    { name: 'khoa hoc doc vi', value: 'SEND_DOCVI' },
    { name: 'bản đầy đủ', value: 'SEND_FULL' }
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
