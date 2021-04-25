# README
# 自分の伝えたいことを書き、そのフィードバックをもらえる掲示板アプリケーション
 [![Image from Gyazo](https://i.gyazo.com/30cfeb5d5bdf7adb63a11b950133e4d8.jpg)](https://gyazo.com/30cfeb5d5bdf7adb63a11b950133e4d8)
 [![Image from Gyazo](https://i.gyazo.com/5368c9d5a11180de568afc6173704483.jpg)](https://gyazo.com/5368c9d5a11180de568afc6173704483)
# App URL
https://forum-original.herokuapp.com/
# テスト用アカウント
Basic認証
* ユーザー名 : admin
* パスワード : 2222

テストアカウント1
* メールアドレス : danburudoa4869@icloud.com
* パスワード : danburudoa515

テストアカウント2
* メールアドレス : danburudoa515@icloud.com
* パスワード : danburudoa515

# 機能一覧
* ユーザー登録、ログイン機能(devise)
* 投稿機能
  - Active Storage
* 投稿一覧機能
* 投稿編集機能
* 投稿削除機能
* コメント機能
  -  Action Cable
* ページネーション機能(kaminari)
* jQuery
  -  スムーススクロール
  -  ドロワー
  -  スクロールトップ
* レスポンシブデザイン(トップページのみ)

# 目指した課題解決
自分の考えに対して、他者はどのような考えを持つのかを知るために掲示板アプリを作成した。また、フィードバックをもらい、それを投稿者自身の人生に活かしていけるような掲示板アプリケーションを目指した。

```
ユーザー管理機能
```
ログイン前 : トップ画面に「新規登録」、「ログイン」のボタンがある
[![Image from Gyazo](https://i.gyazo.com/24128e692d32564d2540fb0a9574ddd2.jpg)](https://gyazo.com/24128e692d32564d2540fb0a9574ddd2)
ログイン後 : トップ画面に「ログアウト」、「投稿する」にボタンが切り替わる
[![Image from Gyazo](https://i.gyazo.com/b623b9bc1b84b3eb6fcfe2e8ce672acd.jpg)](https://gyazo.com/b623b9bc1b84b3eb6fcfe2e8ce672acd)
```
投稿機能
```
投稿後トップページへ遷移するGIF
[![Image from Gyazo](https://i.gyazo.com/5a10e5f19ea73371c7ad96b51b93638f.gif)](https://gyazo.com/5a10e5f19ea73371c7ad96b51b93638f)
```
コメント投稿機能
```
[![Image from Gyazo](https://i.gyazo.com/f0f742271863f10a257fe69d67212199.gif)](https://gyazo.com/f0f742271863f10a257fe69d67212199)

# jQuery
```
スムーススクロール : 最新テーマの数が増えてきたときに、簡単に移動できるよう実装した。
```
[![Image from Gyazo](https://i.gyazo.com/ffa847b456b8f22d622a12a4842b7c97.gif)](https://gyazo.com/ffa847b456b8f22d622a12a4842b7c97)

```
ドロワー : スマホ表示の際に、サイドバーから遷移できるように実装した。
```
[![Image from Gyazo](https://i.gyazo.com/799f7d5e398357648c882e7a98562895.gif)](https://gyazo.com/799f7d5e398357648c882e7a98562895)

# ページネーション
```
コメントが多くなった時、コメントをみやすくするために実装した。
```
[![Image from Gyazo](https://i.gyazo.com/90f7f0fe958df63156c2d305d8b70777.gif)](https://gyazo.com/90f7f0fe958df63156c2d305d8b70777)

# 実装予定の機能
コメントに対しての評価として、プラスとマイナスのカウント機能を実装したい。そのように実装すれば、より独自性のある掲示板アプリケーションになると思う。

# 使用技術
* HTML
* SCSS
* Ruby 2.6.5
* Ruby on Rails 6.0.3.6
* MYSQL 14.14
* jQuery
* Javascript
* Nginx
* Unicorn
* AWS 
  - EC2
* Capistrano
* RSpec
* Github
# テーブル設計

## user テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email     | string | null: false |
| password  | string | null: false |
| nickname  | string | null: false |

### Associate
・belongs_to :board<br>
・belongs_to :comment

## board テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |
| user   | references |         |
| image  |                      |

## Associate
・has_many :users<br>
・belongs_to :comment

## comment テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       |         null: false            |
| user    | references |                                 |
| prototype| references 

## Associate
・has_many :users<br>
・belongs_to :board
