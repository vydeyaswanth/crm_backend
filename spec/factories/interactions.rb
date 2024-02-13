FactoryBot.define do
  factory :interaction do
    title { 'Meeting' }
    details { 'Discuss project requirements.' }
    date { Faker::Date.backward(days: 14) }
    customer
  end
end