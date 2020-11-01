FactoryBot.define do
  factory :application do
    first_name { 'Sean' }
    last_name { 'Connery' }
    dob { '1985-12-13' }
    email { 'aron.belso@gmail.com' }
    telephone { '38591111111' }
    address { 'Ilica 1' }
    qualification { 'VSS' }
    job
  end
end