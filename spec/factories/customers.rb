FactoryBot.define do
  factory :customer do
    name { 'John Doe' }
    email { Faker::Internet.email }
  end
end