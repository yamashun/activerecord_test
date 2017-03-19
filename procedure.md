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

#### DB作成
`rake db:create`  
database.ymlの内容でdbを作成する  
※最新のrailsでは`rake`コマンドがなくなり`rails`コマンドになっている  

#### scaffold
scaffoldコマンドを利用して、アプリケーションの雛形を作成。  
`rails g scaffold car bb_number:integer car_number:string maker:string car_model:string`

#### テーブル作成
`rake db:migrate`
scafoldを実行すると`./db/migrate`にマイグレーションファイルが作成されるので実行してテーブルを作成する

#### 動作確認
`rails s`
localhost:3000/cars

#### tokenのscaffold追加
`rails g scaffold token car:references token:string expiration_date:datetime status:integer`  
`rake db:migrate`

#### shodanのscaffold追加
`rails g scaffold shodan bb_number:integer first_name:string last_name:string status:integer`
`rake db:migrate`

#### ユーザー認証用のコントローラ作成
`rails g controller sms_user_registration`


#### formの作成
###### データ作成
form = UserVerifyForm.new(first_name: '山田', last_name: '俊輔', car_number: '品川500あ10-12')



#### shodansテーブルにindex追加
`rails g migration addIndexToShodan`  

db/migrate/20170319055007_add_index_to_shodan.rb
```
class AddIndexToShodan < ActiveRecord::Migration
  def change
    add_index :shodans, :bb_number
  end
end
```
`rake db:migrate`
