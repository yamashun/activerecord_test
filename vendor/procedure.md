#### 事前準備
- railsインストール
- rubyインストール


#### railsプロジェクトの作成
`rails _4.2.6_ new activerecord_test -d mysql`
- `_4.2.6_`:railsのバージョン、省略可
- `activerecord_test`:プロジェクト名
- `-d mysql`:使用するデータベースの指定、省略可

#### gem編集
`gem pry-rails`を追加し、プロジェクトのルートで`bundle install`を実行
```
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry-rails'
end
```

#### scafold
`rails g scaffold car bb_number:integer car_number:string maker:string car_model:string`
