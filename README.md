<div align="center">
  <img src="https://user-images.githubusercontent.com/95406672/153352536-c8989948-ccca-42f2-84e4-88b769097435.png">
</div>  

## アプリ概要
ペットの写真を投稿するアプリです  
コメント機能やいいね機能、フォロー機能を通してユーザ同士で交流こともできます

## 開発した背景
##### アプリコンセプト
* 癒しの場としたい
* 動物の魅力の再発見
* ペットの写真を通して、人と人との交流を広げる場としたい
* 感じやすくなっている孤独感を和らげる場としたい

##### コンセプト説明
コロナ禍において、自宅にいる時間が増え、周りの人との接点が減った結果、孤独感を感じやすくなっています。

こういった状況はメンタルヘルスに悪影響だと考え、少しでもストレスを和らげられるものはないかと考えました。

そこで動物の人に与える癒しに注目し、それを共有することで幸せな感情を与えてくれるのではないかと考えました。

動物の人を癒してくれる力で、孤独感を和らげたり、他人との交流が深めたりできればいいなと考え、

このペットの写真を投稿するアプリを制作しました。

## アプリリンク
##### https://pet-photo-app.herokuapp.com/  

##### テストアカウント
email: test@example.com  
password: test  

## 機能一覧
* ユーザー機能
  * アカウント新規登録、ログイン、ログアウト
  * ユーザー一覧表示
* 投稿機能
  * 新規投稿、投稿削除
  * 投稿一覧表示、投稿詳細表示
* フォロー機能
  * フォロー、フォロワー一覧表示
  * フォロー、フォロー解除にAjaxを使用
* いいね機能
  * いいねした投稿一覧表示
  * いいね、いいね解除にAjaxを使用
* コメント機能
  * コメント一覧表示
  * 新規コメント投稿、コメント削除
* ページネーション機能
  * 投稿一覧、いいねした投稿一覧、ユーザー一覧、コメント一覧など

## 使用画面
<table>
  <tr>
    <td><img alt="petphoto-toppage" src="https://user-images.githubusercontent.com/95406672/153592771-b7b8e353-e5f0-49b9-a1e1-8f256bf28349.png"></td>
    <td><img alt="petphoto-signup" src="https://user-images.githubusercontent.com/95406672/153594569-a4bdd66a-9b41-449e-8f92-fa044cb9defa.png"></td>
  </tr>
  <tr>
    <td><img alt="petphoto-post" src="https://user-images.githubusercontent.com/95406672/153595355-5e968697-371a-42dc-b6dc-5c05e4730aa2.jpg"></td>
    <td><img alt="ajax-gif" src="https://user-images.githubusercontent.com/95406672/153595561-af55f56e-4567-4759-8bdf-37f2ef4cf42c.gif"></td>
  </tr>
</table>

## 使用技術
#### フロントエンド
  * HTML/CSS
  * JavaScript
  * Bootstrap 5.0.0

#### バックエンド
  * Ruby 3.0.0
  * Rails 6.1.4.4

#### インフラ
  * heroku

## ER図
![ER petphoto](https://user-images.githubusercontent.com/95406672/153440353-ea3487ec-6e3e-4839-913d-4fbbcb5616ad.png)
