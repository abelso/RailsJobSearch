FactoryBot.define do
  factory :job do
    title { 'Rails Developer' }
    description { 'Some description' }
    name { 'Ingemark' }
    email { 'ingemark@asd.asd' }
    category { 'IT' }
    deadline { '2020-11-15' }
  end
end