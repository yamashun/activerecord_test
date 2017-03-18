## 複数テーブル検索時のアクティブレコードの動きを検証するためのプロジェクト

#### テーブル構造
##### トークンテーブル(tokens)
|カラム名|型|備考|
|---|---|---|
|id|int||
|car_id|int|reference|
|token|varchar(32)|index|
|expiration_date|datetime| |
|status|int| |
##### 車テーブル(cars)
|カラム名|型|備考|
|---|---|---|
|id|int| |
|bb_number|int| |
|car_number|string| |
|maker|string| |
|car_model|string| |
##### 商談テーブル(shodans)
|カラム名|型|備考|
|---|---|---|
|id|int||
|bb_no|int||
|last_name|varchar(50)||
|frist_name|varchar(50)||
|ステータス|int||


####　検証手順
