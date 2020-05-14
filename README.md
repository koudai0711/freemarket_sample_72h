## トップページ
![d0efe378eda9f6608079a1034194a44e](https://user-images.githubusercontent.com/61679701/81924270-dd567100-9619-11ea-9c2d-8e364855e3ab.gif)
## 商品ページ
![0ebb673703451d901c5b3f8e1d021a84](https://user-images.githubusercontent.com/61679701/81925164-1ba06000-961b-11ea-8bcb-6bec9f443aea.gif)
## 出品ページ
![e9a9994103827797089cffce408c5dc3](https://user-images.githubusercontent.com/61679701/81925335-53a7a300-961b-11ea-95d1-8c47cc1fc3bb.gif)

## アプリケーション情報
### アプリケーション概要
フリーマーケットのアプリケーションを作成しました。
### 接続先情報
##### URL http://18.179.144.39/
##### ID/Pass
  ID: 1111<br>
Pass: 2222<br>
### テスト用アカウント等
##### 購入者用
メールアドレス: buyer_user@gmail.com<br>
パスワード: bbbbbbb<br>
購入用カード情報<br>
番号：4242424242424242<br>
期限：12/20<br>
セキュリティコード：123<br>
##### 出品者用
メールアドレス名: seller_user@gmail.com<br>
パスワード: sssssss<br>
## 機能一覧
ユーザー新規登録、ログイン機能<br>
商品出品機能<br>
商品購入機能<br>
商品のカテゴリー登録、表示機能<br>
商品の詳細表示機能<br>
出品した商品の編集、削除機能<br>

## 開発環境
Ruby 2.5.1<br>
Ruby on Rails 5.4.2 <br>
MySQL 14.14<br>
Github<br>
AWS (EC2, S3)<br>
Capistranoによる自動デプロイ<br>
Visual Studio Code<br>

## 開発期間と平均作業時間
開発期間：約4週間<br>
1日あたりの平均作業時間：約9時間<br>
開発体制<br>
人数：4人<br>
アジャイル型開発（スクラム）<br>
Trelloによるタスク管理<br>
## 動作確認方法
Chromeの最新版を利用してアクセスしてください。<br>
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。<br>
接続先およびログイン情報については、上記の通りです。<br>
同時に複数の方がログインしている場合に、ログインできない可能性がございます。<br><br>

テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品<br>
テストアカウントでログイン→トップページから商品検索→商品選択→商品購入<br>

確認後、ログアウト処理をお願いします。

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|user_image|string|
|introduction|text|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|


### Association
- has_many :products dependent: :destroy
- belongs_to :destination
- has_many :cards dependent: :destroy
- has_many :addresses dependent: :destroy

## productテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|brand_id|integer|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|status|string|null: false|
|shipping_cost|string|null: false|
|prefecture_id|string|null: false|
|shipping_days|string|null: false|
|price|string|null: false|
<!-- |size|string|null: false| -->
<!-- |shipping_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true| -->


### Association
- belongs_to :user 
- belongs_to :category
- belongs_to :brand
- has_many :images dependent: :destroy
- belongs_to_active_hash :prefecture


## destinationテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,  foreign_key: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|


### Association
- belongs_to :user
- has_many :addresses dependent: :destroy



## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false foreign_key: true|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|

### Association
- belongs_to :user
- belongs_to :destination



## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :products dependent: :destroy


## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true|
### Association
- has_many :products dependent: :destroy


## cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

