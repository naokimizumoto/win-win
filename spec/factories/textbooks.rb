FactoryBot.define do
  factory :textbook do
    name { Faker::Lorem.characters(number: 10) }
  end
end