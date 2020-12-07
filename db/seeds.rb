# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'test1@test.com',
  password: 'testtest'
)

Customer.create!(
  email: "aa@aaa",
  last_name: "山田a",
  first_name: "太郎",
  first_name_kana: "タロウ",
  last_name_kana: "ヤマダ",
  postal_code: "0011234",
  address: "東京都渋谷区神南1-19-11 パークウェースクエア2 4階",
  phone_number: "09011112222",
  is_deleted: false,
)