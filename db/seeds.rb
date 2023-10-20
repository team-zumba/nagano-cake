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
24.times do |num| #num = 0~4が入る
  num += 1
  Customer.create!(
    last_name: "山田",
    first_name: "太郎#{num}", #ループごとに太郎1~太郎10
    last_name_kana: 'ヤマダ',
    first_name_kana: "タロウ",
    postal_code: 1000000 + num,
    address: "東京都新宿区ズンバタワー#{num}",
    telephone_number: 10000000000 + num,
    email: "yamada@taro#{num}",
    encrypted_password: 'yamadataro',
    password: 'yamadataro',
    password_confirmation: 'yamadataro',
    is_active: true
  )
end


################### 顧客（山田花子）
yamada_num = Customer.all.count
24.times do |num|
  num += yamada_num + 1
  Customer.create!(
    last_name: "山田",
    first_name: "花子#{num}",
    last_name_kana: "ヤマダ",
    first_name_kana: "ハナコ",
    postal_code: 1000000 + num,
    address: "東京都新宿区ズンバタワー#{num}",
    telephone_number: 10000000000 + num,
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
  'プリン',
  '焼き菓子',
  'キャンディ'
]

genres.each do |genre|
  Genre.create!(
    name: genre
  )
end


################### アイテム（ケーキ）
items_array = [
  # ケーキ（ジャンルID:1）
  [
    'ショートケーキ',
    'チョコレートケーキ',
    'モンブランケーキ',
    'ブッシュドノエル',
    'レアチーズケーキ',
    'ベイクドチーズケーキ',
    'スフレチーズケーキ',
    'ニューヨークチーズケーキ',
    'かぼちゃタルト',
    '栗のタルト',
    'さつまいもタルト',
    'タルトタタン'
  ],

  # プリン（ジャンルID:2）
  [
    'カスタードプリン',
    'チョコレートプリン',
    '抹茶のプリン',
    'パンプキンプリン'
  ],

  # 焼き菓子（ジャンルID:3）
  [
    'マーブルパウンドケーキ',
    'プレーンパウンドケーキ',
    'チョコレートパウンドケーキ',
    '抹茶パウンドケーキ',
    'マドレーヌ'
  ],

  # キャンディ（ジャンルID:4）
  [
    'ペロペロキャンディ',
    '惑星キャンディ',
    'ロゴマーク入りキャンディ'
  ]
]

items_array.each_with_index do |items, i| #iはジャンルIDになる
  items.each_with_index do |item, j|
    item = Item.create!(
      name: item,
      introduction: "#{item}の説明です。とても美味しいですよ。",
      genre_id: i+1,
      price: 500,
      is_active: true
    )

    # 画像を登録
    item.image.attach(io: File.open(Rails.root.join("app/assets/images/item-#{i+1}-#{j+1}.jpg")), filename: "item-#{i+1}-#{j+1}.jpg")
  end
end


################### 注文

Customer.all.count.times do |i|
  i += 1

  customer = Customer.find(i) #ユーザーID1~9の顧客かループ毎に取得される

  Order.create!(
    customer_id: i, #1~9
    address: customer.address,
    name: customer.last_name + customer.first_name,
    postal_code: customer.postal_code,
    total_payment: 9999,
    shipping_cost: 800,
    status: rand(0..4), #0~4の数値がランダムで代入される
    payment_method: rand(0..1)
  )
end



################### 注文詳細

Order.all.count.times do |i|
  i += 1

  item_count = Item.all.count #アイテムの数を取得

  OrderDetail.create!(
    order_id: i,
    item_id: rand(1..item_count), #1~アイテムの個数をランダムで取得
    price: 999,
    amount: rand(1..20), #1~20
    making_status: rand(0..3)
  )
end