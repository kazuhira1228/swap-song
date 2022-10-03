# README


# アプリケーション名
swap-song


# アプリケーション概要
社会人アカペラサークル「音活サークル(仮名)」に所属しているアカペラバンドの活動記録をシェアし、アプリ上で交流しながら楽しくアカペラ活動ができる。


# URL
(製作中)


# テスト用アカウント
Basic認証パスワード：kazuhira
Basic認証ID：1228
メールアドレス：(製作中)
パスワード：(製作中)


# 利用方法
1. トップページのヘッダーから、ユーザー新規登録を行う
2. グループの登録が完了していなければ、ユーザー新規登録後にグループの登録も行う
3. 投稿ボタンから、活動内容(練習日)・練習スタジオ・練習内容などを入力し、投稿する
4. ログインユーザーであれば、投稿された活動記録にコメントを送ることができる


# アプリケーションを作成した背景
音活サークルでは、300名近くのメンバーが所属し、それぞれアカペラグループを組んで活動をしている。しかし、他のグループの活動内容が分からないという問題があった。グループの活動内容を共有できれば、お互いの練習の参考になり、かつ交流を深めることができると考え、今回のアプリケーションを開発することにした。


# 洗い出した要件
https://docs.google.com/spreadsheets/d/1GRtBkkSNy82Af5Ng-pJrKmbSj7qkhp0bPDIX3d2bBjk/edit#gid=982722306


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
| favorite_singer    | string     |                                |
| more_join_id       | integer    |                                |
| group              | string     |                                |
### Association
- has_many :activities
- has_many :groups
- has_many :comments

## activitiesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| group              | string     | null: false                    |
| activity_day       | date       | null: false                    |
| practice_song      | string     | null: false                    |
| studio             | string     | null: false                    |
| text               | text       | null: false                    |
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