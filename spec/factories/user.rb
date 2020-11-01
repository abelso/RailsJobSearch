FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Smith' }
    email { 'john.smith@gmail.com' }
    password { '123456' }
  end
end