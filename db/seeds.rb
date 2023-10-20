# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


###########################
# データベースに初期データを追加する処理を記述するファイル
###########################



########################### 管理者

# create = new + save
Admin.create!(
  email: 'admin@admin',
  encrypted_password: 'adminmin',
  password: 'adminmin',
  password_confirmation: 'adminmin',
)



########################### 設定（ここの数値を変更するだけでレコード数を調節できます）

# 顧客ユーザー（山田太郎）の人数
yamada_taro_num = 24
# 顧客ユーザー（山田花子）の人数
yamada_hanako_num = 24
# 1ユーザーに登録する住所の最大数（１件〜？件）
registered_address_maximum = 5
# 1ユーザーが購入する1商品あたりの最大個数（1個〜？個）
buy_item_num_maximum = 10
# 1ユーザーが購入する商品の最大種類数（1種類〜？種類）
buy_item_type_maximun = 5
# 1ユーザーに登録する注文履歴の最大数（１〜？件）
registered_order_history_maximum = 20

########################### 



########################### 顧客（山田太郎）

yamada_taro_num.times do |num|
  num += 1 #numが「0」スタートなので「1」スタートに調整
  Customer.create!(
    last_name: "山田",
    first_name: "太郎#{num}",
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



########################### 顧客（山田花子）

yamada_hanako_num.times do |num|
  num += 1 + yamada_taro_num #「山田太郎の人数+1」分調整
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



########################### 登録住所

Customer.all.count.times do |i|
  i += 1 #customerID
  rand(1..registered_address_maximum).times do |j|
    j += 1
    Address.create!(
      customer_id: i,
      name: "株式会社ズンバ",
      address: "大阪府難波ずんずんマンション #{i}-#{j}",
      postal_code: "123-4567"
    )
  end
end



########################### ジャンル

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



########################### アイテム

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

items_array.each_with_index do |items, i| 
  i += 1 #ジャンルID
  items.each do |item|
    item = Item.create!(
      name: item,
      introduction: "#{item}の説明です。とても美味しいですよ。",
      genre_id: i,
      price: 500,
      is_active: true
    )
    # 画像を登録
    item.image.attach(io: File.open(Rails.root.join("app/assets/images/items/img-#{Item.all.count}.jpg")), filename: "img-#{Item.all.count}.jpg")
  end
end



########################### カートアイテム、オーダー、オーダー詳細

Customer.all.count.times do |i|
  i += 1 #顧客ID

  # 作成したい1ユーザーあたりの注文履歴数分、CartItem・Order・OrderDetail作成を繰り返す
  rand(1..registered_order_history_maximum).times do



    ########################### 各ユーザーのカートアイテム（seeds最後尾で消去）

    total_price = 0 #小計（送料を含まない合計金額）
    rand(1..buy_item_type_maximun).times do
      cart_item = CartItem.new(
        customer_id: i,
        item_id: rand(1..Item.all.count),
        amount: rand(1..buy_item_num_maximum)
      )
      cart_item.save
      total_price += Item.find(cart_item.item_id).price * cart_item.amount
    end



    ########################### オーダー

    customer = Customer.find(i)
    order = Order.new(
      customer_id: i,
      address: customer.address,
      name: customer.last_name + customer.first_name,
      postal_code: customer.postal_code,
      total_payment: total_price + 800,
      shipping_cost: 800,
      status: rand(0..4),
      payment_method: rand(0..1)
    )
    order.save



    ########################### 注文詳細

    CartItem.where(customer_id: i).each do |cart_item|
      OrderDetail.create!(
        order_id: order.id,
        item_id: cart_item.item_id,
        price: Item.find(cart_item.item_id).price,
        amount: cart_item.amount,
        making_status: rand(0..3)
      )
    end

    # ユーザーのカートの中身を空にする
    CartItem.destroy_all
  end
end