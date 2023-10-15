# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# データベースに初期データを追加する処理を記述するファイル

################### 管理者
# create = new + save
Admin.create!(
  email: 'admin@admin',
  encrypted_password: 'adminmin',
  password: 'adminmin',
  password_confirmation: 'adminmin',
)


################### 顧客（山田太郎）
5.times do |num| #num = 0~4が入る
  num += 1
  Customer.create!(
    last_name: "山田",
    first_name: "太郎#{num}", #ループごとに太郎1~太郎10
    last_name_kana: 'ヤマダ',
    first_name_kana: "タロウ#{num}",
    postal_code: "#{num}23-4567",
    address: "東京都新宿区ズンバタワー#{num}",
    telephone_number: "090-123-456#{num}",
    email: "yamada@taro#{num}",
    encrypted_password: 'yamadataro',
    password: 'yamadataro',
    password_confirmation: 'yamadataro',
    is_active: true
  )
end


################### 顧客（山田花子）
4.times do |num|
  num += 6
  Customer.create!(
    last_name: "山田",
    first_name: "花子#{num}",
    last_name_kana: "ヤマダ",
    first_name_kana: "ハナコ#{num}",
    postal_code: "#{num}23-4567",
    address: "東京都新宿区ズンバタワー#{num}",
    telephone_number: "090-123-456#{num}",
    email: "yamada@hanako#{num}",
    encrypted_password: 'yamadahanako',
    password_confirmation: 'yamadahanako',
    password: 'yamadahanako',
    is_active: true
    )
end


################### 登録住所
9.times do |num|
  num += 1
  Address.create!(
    customer_id: num,
    name: "株式会社ズンバ",
    address: "大阪府難波ずんずんマンション1",
    postal_code: "123-9876"
    )
end


################### ジャンル
genres = [
  'ケーキ',
  'チーズケーキ',
  'タルト',
  'パウンドケーキ',
  'その他'
]

genres.each do |genre|
  Genre.create!(
    name: genre
  )
end


################### アイテム（ケーキ）
items_array = [
  # ケーキ（ジャンルID:0）
  [
    'ショートケーキ',
    'チョコレートケーキ',
    'モンブランケーキ',
    'ブッシュドノエル'
  ],

  # チーズケーキ（ジャンルID:1）
  [
    'レアチーズケーキ',
    'ベイクドチーズケーキ',
    'スフレチーズケーキ',
    'ニューヨークチーズケーキ'
  ],

  # タルト（ジャンルID:2）
  [
    'かぼちゃタルト',
    '栗のタルト',
    'さつまいもタルト',
    'タルトタタン'
  ],

  # パウンドケーキ（ジャンルID:3）
  [
    'マーブルパウンドケーキ',
    'プレーンパウンドケーキ',
    'チョコレートパウンドケーキ',
    '抹茶パウンドケーキ'
  ],

  # その他（ジャンルID:4）
  [
    'シュークリーム',
    'プリン',
    'マドレーヌ'
  ]
]

items_array.each_with_index do |items, i| #iはジャンルIDになる
  items.each_with_index do |item, j|
    Item.create!(
      genre_id: i,
      name: item,
      introduction: "#{item}の説明です。こだわりの味。",
      price: 500,
      is_active: true,
      image: File.open("app/images/item-#{i+1}-#{j+1}.jpg")
    )
  end
end