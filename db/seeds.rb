# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
students_array = [
  { name: '水本', name_kana: "みずもと",number: '1234', email: 'a@outlook.jp', password: 'naokimizu'},
  { name: '川崎', name_kana: "かわさき",number: '5678', email: 'b@outlook.jp', password: 'naokimizu'},
  { name: '大和', name_kana: "やまと",number: '9012', email: 'c@outlook.jp', password: 'naokimizu'},
]
students_array.each do |data|
  Student.create!(name: data[:name], number: data[:number],email: data[:email], password: data[:password])
end

teachers_array = [
  { name: '田中', email: 'd@outlook.jp', password: 'naokimizu'},
  { name: '中田', email: 'e@outlook.jp', password: 'naokimizu'},
  { name: '山本', email: 'f@outlook.jp', password: 'naokimizu'},
]
teachers_array.each do |data|
  Teacher.create!(name: data[:name], email: data[:email], password: data[:password])
end