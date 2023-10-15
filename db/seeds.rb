# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# データベースに初期データを追加する処理を記述するファイル

# create = new + save
# 管理者
Admin.create!(
  email: 'admin@admin',
  encrypted_password: 'admin'
)


# 顧客（山田太郎）
5.times do |num| #num = 0~9が入る
  num += 1
  Customer.create!(
    last_name: "山田",
    first_name: "太郎#{num}", #ループごとに太郎1~太郎10
    last_name_kana: 'ヤマダ',
    first_name_kana: "タロウ#{num}",
    postal_cord: "#{num}23-4567",
    address: "東京都新宿区ズンバタワー#{num}",
    telephone_number: "090-123-456#{num}",
    email: "yamada@taro#{num}",
    encrypted_password: 'yamadataro',
    is_active: true
  )
end