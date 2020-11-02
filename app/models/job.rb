class Job < ApplicationRecord
  has_many :applications, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :category, presence: true
  validates :deadline, presence: true

end
