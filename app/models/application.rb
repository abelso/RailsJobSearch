class Application < ApplicationRecord
  belongs_to :job

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :telephone, presence: true, format: { with: /\A[0-9'-]*\z/ }
  validates :address, presence: true
  validates :qualification, presence: true

end
