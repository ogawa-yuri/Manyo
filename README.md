# Manyo

 万葉課題のタスク管理アプリケーション

## tasksテーブル

 |Column  |Type    |Options    |
 |--------|--------|-----------|
 |title   |string  |null: false|
 |content |string  |null: false|

## デプロイ方法

1.デプロイ前にアセットプリコンパイルを実施する。
`$ rails assets:precompile RAILS_ENV=production`

2.コミットをする。
`$ git add -A`
`$ git commit -m "コミットメッセージ"`

3.Herokuに新しいアプリケーションを作成する。
`heroku create`

4.Herokuにデプロイする。
`$ git push heroku master`

5.データベースを移行する。
`$ heroku run rails db:migrate`
