# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
students_array = [
  { name: '水本', number: '1234', email: 'a@tanaka', password: 'naokimizu'},
  { name: '川崎', number: '5678', email: 'b@tanaka', password: 'naokimizu'},
  { name: '大和', number: '9012', email: 'c@tanaka', password: 'naokimizu'},
]
students_array.each do |data|
  Student.create!(name: data[:name], number: data[:number],email: data[:email], password: data[:password])
end

