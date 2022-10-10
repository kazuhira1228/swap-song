# README


# アプリケーション名
swap-song


# アプリケーション概要
社会人アカペラサークル「音活サークル(仮名)」で活動中のアカペラバンドの活動記録をはじめ、バンド情報やメンバーリストなどをアプリ上で共有できるWebアプリケーション。


# URL
https://swap-song.herokuapp.com/


# テスト用アカウント
Basic認証パスワード：kazuhira  
Basic認証ID ：1228  
メールアドレス：test@com  
パスワード：test37853  


# 利用方法
1. トップページのヘッダーから、ユーザー新規登録を行う。
2. トップページのボタンから、活動記録TLとグループ(バンド)一覧を見るページに遷移できる。所属しているグループの登録がなければ、予め登録を行う。
3. 投稿ボタンから、練習日・練習スタジオ・活動内容などを入力し、活動記録TLへ投稿することができる。
4. ログインユーザーであれば、投稿された活動記録にコメントを送ることができる。


# アプリケーションを作成した背景
「音活サークル」では、200名近くのメンバーが所属し、それぞれがアカペラバンドを組んで活動をしている。しかし、これだけ大きなコミュニティにも関わらず、他のバンドの活動内容やメンバーの情報が分からないという問題点があった。バンド情報と所属メンバーの情報を開示した上で、活動内容を共有できれば、お互いの練習の参考になり、刺激し合いながらアカペラを楽しむことができると考え、今回のアプリケーションを開発することにした。また、転勤などで脱退した際に、バンドメンバーの欠員の補充をよりスムーズに行えるよう、あらかじめアプリの新規登録時に、対応できるパートと他バンドへの兼任希望の有無を登録できるようにした。


# 洗い出した要件
[![Image from Gyazo](https://i.gyazo.com/0c69a1399b8b547019cd2067e773c1b2.png)](https://gyazo.com/0c69a1399b8b547019cd2067e773c1b2)


# 実装した機能についての画像やGIF及びその説明
＜活動記録TLの実装＞  
  各バンドの日々の活動を可視化できるよう、タイムライン形式で投稿日が最近のものから順に表示される。ログイン中であれば、画面右下に投稿ボタンが出現する。詳細ボタンから詳細ページに移動すると、より詳細な情報を確認でき、コメント(ログインユーザーのみ)を送ることもできる。
[![Image from Gyazo](https://i.gyazo.com/c5c54411f2e7c24fff059a1c606c3959.jpg)](https://gyazo.com/c5c54411f2e7c24fff059a1c606c3959)

＜グループ一覧の実装＞  
  登録されたアカペラバンドが、一覧で表示される。ログイン中であれば、画面右下に登録ボタンが出現する。グループ名しか表示されないため、詳細を確認する場合は、詳細ボタンから詳細ページに移動する。
[![Image from Gyazo](https://i.gyazo.com/bb1a19103b35d369fd518e0834681a44.jpg)](https://gyazo.com/bb1a19103b35d369fd518e0834681a44)

＜他バンドの参加希望の有無＞  
 新規登録時に、他バンドの兼任希望の有無を登録できる。
[![Image from Gyazo](https://i.gyazo.com/7fd002d8933984a1793709200e020c32.jpg)](https://gyazo.com/7fd002d8933984a1793709200e020c32)


# 実装予定の機能
＜動画の埋め込み＞   
  アカペラバンドの持ち曲を歌唱している動画を、任意でバンド詳細画面にアップできるようにしたい。


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
[![Image from Gyazo](https://i.gyazo.com/597d0841a9855c66f889d6fa477f2a80.png)](https://gyazo.com/597d0841a9855c66f889d6fa477f2a80)


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/fbd73fbef48c5a809e3ce006e6e27793.png)](https://gyazo.com/fbd73fbef48c5a809e3ce006e6e27793)

# 開発環境
・フロントエンド  
・バックエンド  
・インフラ  
・テスト  
・テキストエディタ  


# ローカルでの動作方法
以下のコマンドを順に実行する。  
% git clone https://github/swap-song  
% cd swap-song  
% bundle install  
% yarn install  


# 工夫したポイント
開発を行う前に、実際のバンドメンバーに「音活サークル」の満足している点・満足していない点のヒアリングを行った。ヒアリングの結果、他のバンドが普段どんな活動をしているのか、どんなメンバーがいてどんな曲を練習しているのか、情報を知りたいという意見が多く上がった。そこから、メンバーの抱えている困り事をどうアプリで解決できるかを考え、本アプリの構想に至った。サーバサイドの実装では、これまでの学習で培った知識を活かしつつ、topsコントローラーによるトップページの実装や、登録・削除ボタンの操作後に出現するダイアログボックスの実装など、自ら外部サイトで調べた技術を本アプリの開発に取り入れることができた。フロントのマークアップでは、少しでも利用者に親しみを感じてもらえるよう、トップページの背景にコンデンサーマイクの写真素材を導入したりするなど、見栄えの良いデザインになるよう工夫した。タスク管理は、事前に作成した要件定義書などを参考にゴールまでの数週間のスケジュールを決め、そこから日々の学習に落とし込んで行うことができた。
