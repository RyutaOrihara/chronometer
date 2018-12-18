# README

# chronomater

イベント企画アプリ　クロノメーター
* * *
## 概要
* * *
主催者側は簡単にイベント登録ができ、参加者側はボタンを押すだけで参加登録できます。


## コンセプト
* * *
イベントを通して企画者と参加者の繋がりを作る。


## バージョン
* * *
Ruby version: 2.5.1
Rails version: 5.1.6

## 機能一覧
* * *
*  ログイン機能
*  ユーザー登録機能(サインアップ)
    *  メールアドレス、名前、パスワードは必須
* パスワード再設定機能
*  マイページ機能
    * 企画イベント一覧を表示
    * 参加イベント一覧を表示
    * フォロー一覧を表示
    * フォロワー　一覧を表示
* ユーザー情報変更機能
    * 名前変更
    * メールアドレス変更
    * パスワード変更
    * 画像アイコン変更
    * ページネーション機能
* イベント一覧表示機能
    * イベント検索で検索結果をイベント一覧に更新する。
    * 開催日時が過ぎたものを表示しないようにする。
*  新規イベント作成機能
    *  タイトル、開催期間、開催地、定員数、写真、内容文は必須
*  イベント情報編集機能
*  イベント情報削除機能
    *  イベント情報編集とイベント情報削除は投稿者のみ実行可能
* イベント詳細機能
*  イベント参加機能
    *  イベント参加については1つのイベントに対して1人1回しかできない。
    *  自分自身のイベントには参加ボタンが表示されない。
* イベントキャンセル機能
    * 参加したイベントのみキャンセルボタンが表示される。
*  フォロー、フォロワー機能
    * 同じユーザーを二度フォローできないようにする
    * フォローすると、フォロー一覧にフォローした人が表示される。
    * フォローされると、フォロワー一覧にフォロワーしてくた人が表示される。

## カタログ設計
* * *
https://docs.google.com/spreadsheets/d/1Vde67qXL4vig2bJBNAQThFvFVdNbcsnBay6z0YBkbF0/edit#gid=871795969

## テーブル定義
* * *
https://docs.google.com/spreadsheets/d/1Vde67qXL4vig2bJBNAQThFvFVdNbcsnBay6z0YBkbF0/edit#gid=1069086702

## 画面遷移図
* * *
https://docs.google.com/spreadsheets/d/1Vde67qXL4vig2bJBNAQThFvFVdNbcsnBay6z0YBkbF0/edit#gid=1311122324

## 画面ワイヤーフレーム
* * *
https://docs.google.com/spreadsheets/d/16TSc2vaI5MALFkMnvTmCX_uMcPg0xbREI9fFVD9UWhE/edit#gid=0

## 使用予定Gem
* * *
* devise
* kaminari (’kaminari', '~> 0.17.0’)
* ransack
* carrierwave
* mini_magick
