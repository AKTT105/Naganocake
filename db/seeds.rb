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
  genre_id: '3',
  name: 'くまさんクッキー',
  image_id: '5',
  introduction: 'みんな大好きくまさんクッキーです。こだわりの食感をお楽しみください。',
  price: '270',
  is_active: 'TRUE',
  },
  {
  id: '6',
  genre_id: '3',
  name: '木曽路パイ',
  image_id: '6',
  introduction: '木曽路をイメージしたパイです。蕎麦のようなコシを再現しました。',
  price: '330',
  is_active: 'TRUE',
  },
  {
  id: '7',
  genre_id: '4',
  name: '八方尾根の粉雪',
  image_id: '7',
  introduction: '八方尾根に降り積もる雪をイメージしたキャンディです。ホワイトデーにもおすすめです。',
  price: '300',
  is_active: 'TRUE',
  },
  {
  id: '8',
  genre_id: '1',
  name: '姥捨夜景',
  image_id: '8',
  introduction: '姥捨山(冠着山)から見た夜景を再現したケーキです。',
  price: '400',
  is_active: 'TRUE',
  },
  {
  id: '9',
  genre_id: '2',
  name: '小諸の蕎麦粉クッキー',
  image_id: '9',
  introduction: '小諸産の蕎麦を使ったクッキーです。蕎麦の風味が甘さとマッチしたハーモニーをお楽しみください。',
  price: '350',
  is_active: 'TRUE',
  },
  {
  id: '10',
  genre_id: '1',
  name: '諏訪湖絵巻',
  image_id: '10',
  introduction: '諏訪湖の花火大会をイメージしたロールケーキです。',
  price: '300',
  is_active: 'TRUE',
  },
  {
  id: '11',
  genre_id: '1',
  name: '妻籠宿プリン',
  image_id: '11',
  introduction: '栗を使用したプリンです。栗きんとんが有名な岐阜・長野間を彷彿とさせます。',
  price: '700',
  is_active: 'TRUE',
  },
  {
  id: '12',
  genre_id: '1',
  name: '善光寺参りの千歳飴',
  image_id: '12',
  introduction: '期間限定だった善光寺参りの千歳飴が、定番商品になりました。',
  price: '300',
  is_active: 'TRUE',
  }])


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
  genre_id: '3',
  name: 'くまさんクッキー',
  image_id: '5',
  introduction: 'みんな大好きくまさんクッキーです。こだわりの食感をお楽しみください。',
  price: '270',
  is_active: 'TRUE',
  },
  {
  id: '6',
  genre_id: '3',
  name: '木曽路パイ',
  image_id: '6',
  introduction: '木曽路をイメージしたパイです。蕎麦のようなコシを再現しました。',
  price: '330',
  is_active: 'TRUE',
  },
  {
  id: '7',
  genre_id: '4',
  name: '八方尾根の粉雪',
  image_id: '7',
  introduction: '八方尾根に降り積もる雪をイメージしたキャンディです。ホワイトデーにもおすすめです。',
  price: '300',
  is_active: 'TRUE',
  },
  {
  id: '8',
  genre_id: '1',
  name: '姥捨夜景',
  image_id: '8',
  introduction: '姥捨山(冠着山)から見た夜景を再現したケーキです。',
  price: '400',
  is_active: 'TRUE',
  },
  {
  id: '9',
  genre_id: '2',
  name: '小諸の蕎麦粉クッキー',
  image_id: '9',
  introduction: '小諸産の蕎麦を使ったクッキーです。蕎麦の風味が甘さとマッチしたハーモニーをお楽しみください。',
  price: '350',
  is_active: 'TRUE',
  },
  {
  id: '10',
  genre_id: '1',
  name: '諏訪湖絵巻',
  image_id: '10',
  introduction: '諏訪湖の花火大会をイメージしたロールケーキです。',
  price: '300',
  is_active: 'TRUE',
  },
  {
  id: '11',
  genre_id: '1',
  name: '妻籠宿プリン',
  image_id: '11',
  introduction: '栗を使用したプリンです。栗きんとんが有名な岐阜・長野間を彷彿とさせます。',
  price: '700',
  is_active: 'TRUE',
  },
  {
  id: '12',
  genre_id: '1',
  name: '善光寺参りの千歳飴',
  image_id: '12',
  introduction: '期間限定だった善光寺参りの千歳飴が、定番商品になりました。',
  price: '300',
  is_active: 'TRUE',
  }])