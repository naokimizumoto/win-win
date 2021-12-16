FactoryBot.define do
  factory :student do
    name { Faker::Lorem.characters(number: 10) }
    name_kana { Faker::Lorem.characters(number: 10) }
    number { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
