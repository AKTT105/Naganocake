# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'test1@test.com',
  password: 'testtest')

Customer.create!(
  id: '1',
  last_name: '山田',
  first_name: '太郎',
  last_name_kana: 'ヤマダ',
  first_name_kana: 'タロウ',
  postal_code: '1600022',
  address: '東京都新宿区新宿二丁目5-10',
  phone_number: '00011112222',
  email: 'aa@abcde',
  password: '11111111',
  is_deleted: 'FALSE')

Delivery.create!(
  customer_id: '1',
  address: '東京都港区六本木三丁目2-1',
  postal_code: '1066223',
  name: '山田花子',
  )

Genre.create!([{
  id: '1',
  name: 'ケーキ',
  is_active: 'TRUE'
  },
            {
  id: '2',
  name: 'プリン',
  is_active: 'TRUE'
  },
            {
  id: '3',
  name: '焼き菓子',
  is_active: 'TRUE'
  },
            {
  id: '4',
  name: 'キャンディ',
  is_active: 'TRUE'
  }])

Product.create!([{
  id: '1',
  genre_id: '1',
  name: '長野ケーキ',
  image_id: '1',
  introduction: '当店一番のケーキです。創業時の味を守っています。',
  price: '420',
  is_active: 'TRUE',
  },
              {
  id: '2',
  genre_id: '2',
  name: '味噌プリン',
  image_id: '2',
  introduction: '松本駅でも売られている、味噌の風味が美味しいプリンです。',
  price: '300',
  is_active: 'TRUE',
  },
              {
  id: '3',
  genre_id: '3',
  name: '千曲マドレーヌ',
  image_id: '3',
  introduction: '千曲川をイメージしたマドレーヌです。優しい甘さがポイントです。',
  price: '200',
  is_active: 'TRUE',
  },
              {
  id: '4',
  genre_id: '4',
  name: 'りんごバター飴',
  image_id: '4',
  introduction: 'りんごバターを使用したキャンディです。りんごの香りが口いっぱいに広がります。',
  price: '300',
  is_active: 'TRUE',
  },
              {
  id: '5',
  genre_id: '1',
  name: '',
  image_id: '4',
  introduction: 'りんごバターを使用したキャンディです。りんごの香りが口いっぱいに広がります。',
  price: '300',
  is_active: 'TRUE',
  }])
