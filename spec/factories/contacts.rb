FactoryBot.define do
  factory :contact do
    name { 'Jane Smith' }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    customer
  end
end