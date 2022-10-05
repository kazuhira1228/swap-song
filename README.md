# README


# アプリケーション名
swap-song


# アプリケーション概要
社会人アカペラサークル「音活サークル(仮名)」で活動中のアカペラバンドの活動記録をはじめ、バンド情報やメンバーリストなどをアプリ上で共有できるWebアプリケーション。


# URL
https://swap-song.herokuapp.com/


# テスト用アカウント
Basic認証パスワード：kazuhira
Basic認証ID：1228
メールアドレス：test@com
パスワード：test37853


# 利用方法
1. トップページのヘッダーから、ユーザー新規登録を行う
2. トップページから、活動記録TLとグループ(バンド)一覧を見ることができる。所属しているグループの登録がなければ、予め登録を行う。
3. 投稿ボタンから、活動内容(練習日)・練習スタジオ・練習内容などを入力し、活動記録TLへ投稿することができる。
4. ログインユーザーであれば、投稿された活動記録にコメントを送ることができる。


# アプリケーションを作成した背景
音活サークルでは、200名近くのメンバーが所属し、それぞれアカペラバンドを組んで活動をしている。しかし、これだけ大きなコミュニティにも関わらず、他のバンドの活動内容やメンバーの情報が分からないという問題点があった。バンド情報と所属メンバーの情報を開示した上で、活動内容を共有できれば、お互いの練習の参考になり、刺激し合いながらアカペラを楽しむことができると考え、今回のアプリケーションを開発することにした。


# 洗い出した要件
[![Image from Gyazo](https://i.gyazo.com/0c69a1399b8b547019cd2067e773c1b2.png)](https://gyazo.com/0c69a1399b8b547019cd2067e773c1b2)


# 実装した機能についての画像やGIF及びその説明
(製作中)


# 実装予定の機能
(製作中)


# データベース設計
## usersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| sex_id             | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| holiday            | integer    | null: false                    |
| member_since       | date       | null: false                    |
| favorite_part      | string     | null: false                    |
| favorite_singer    | string     | null: false                    |
| more_join_id       | integer    | null: false                    |
| group              | string     | null: false                    |
### Association
- has_many :activities
- has_many :groups
- has_many :comments

## activitiesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| group              | string     | null: false                    |
| activity_day       | date       | null: false                    |
| song               | string     | null: false                    |
| studio             | string     | null: false                    |
| text               | text       | null: false                    |
| image              | string     |                                |
| user               | references | foreign_key: true              |
### Association
- belongs_to :user
- has_many :comments

## groupsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| first_user         | string     | null: false                    |
| second_user        | string     | null: false                    |
| third_user         | string     | null: false                    |
| fourth_user        | string     | null: false                    |
| fifth_user         | string     | null: false                    |
| sixth_user         | string     |                                |
| group_since        | date       | null: false                    |
| text               | text       | null: false                    |
| user               | references | foreign_key: true              |
### Association
- has_many :users

## commentsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| text               | text       | null: false                    |
| user               | references | foreign_key: true              |
| activity           | references | foreign_key: true              |
### Association
- belongs_to :user
- belongs_to :activity


## ER図
[![Image from Gyazo](https://i.gyazo.com/364fdfc521827407cef90dc2059a1b6f.png)](https://gyazo.com/364fdfc521827407cef90dc2059a1b6f)


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/afcf815447bb23d30455783dd0650ed2.png)](https://gyazo.com/afcf815447bb23d30455783dd0650ed2)


# 開発環境
(製作中)


# ローカルでの動作方法
(製作中)


# 工夫したポイント
(製作中)