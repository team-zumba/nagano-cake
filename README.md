# ながのcake　ECサイト
![スクリーンショット 2023-10-25 17 23 38](https://github.com/team-zumba/nagano-cake/assets/143806854/8dd973af-8607-4706-abd6-2e2d4174dacb)
![スクリーンショット 2023-10-25 17 24 33](https://github.com/team-zumba/nagano-cake/assets/143806854/c41d0b63-e8d4-4198-989d-082fcdd34225)
## 概要
※DMM WEBCAP2023年9月生によるチーム開発課題になります。
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発（架空）。
## 案件の背景
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。
## 使用言語
- HTML/CSS
- Sass
- JavaScript
- Ruby
## フレームワーク・ライブラリ
- Ruby on Rails
- devise
- Kaminari
- enum_help
- pry-byebug
- jQuery
- Bootstrap
- Swiper
## 設計書
### ER図
  ![スクリーンショット 2023-10-25 17 41 45](https://github.com/team-zumba/nagano-cake/assets/143806854/acbe4a1b-12c6-47a9-a893-f50669ea1e92)
### アプリケーション詳細設計
![____________________________2023-10-25_17 44 16_720](https://github.com/team-zumba/nagano-cake/assets/143806854/635408b7-9173-437a-939d-ec21c2b7570c)
### テーブル定義書
https://docs.google.com/spreadsheets/d/1vhMkpmsGoLRJH8zG1LdkgXFXwM2NPrOA/edit#gid=986568156
## 実装機能
### 管理者側
- 管理者ログイン、ログアウト
- 商品の新規追加、編集、閲覧、販売停止(売切れ表示)
- 商品ジャンルの追加、編集
- 会員登録されているユーザー情報の閲覧、編集、退会処理
- 全てのユーザーの注文履歴閲覧
- ユーザーごとの注文履歴閲覧
- 注文・製造ステータス変更
- USER検索機能
### 顧客（会員）側
- 会員新規登録、ログイン、ログアウト、退会
- 会員情報の編集
- 配送先の登録、編集、削除
- カートへの追加、商品購入
- 支払い方法、配送先の指定
- 注文履歴の閲覧
- ジャンル検索機能
- 商品検索機能
