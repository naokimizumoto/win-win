FactoryBot.define do
  factory :lesson do
    homework { Faker::Lorem.characters(number: 20) }
    feedback { Faker::Lorem.characters(number: 20) }
    text_name { Faker::Lorem.characters(number: 10) }
    notice { Faker::Lorem.characters(number: 20) }
    starts_at { Faker::Lorem.characters(number: 20) }
    ends_at { Faker::Lorem.characters(number: 20) }
    student
    teacher
  end
end
