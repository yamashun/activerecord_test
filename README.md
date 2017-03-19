## 複数テーブル検索時のアクティブレコードの動きを検証するためのプロジェクト

#### テーブル構造
##### トークンテーブル(tokens)
|カラム名|型|備考|
|---|---|---|
|id|int||
|car_id|int|reference|
|token|varchar|index|
|expiration_date|datetime| |
|status|int| |
##### 車テーブル(cars)
|カラム名|型|備考|
|---|---|---|
|id|int| |
|bb_number|int|index|
|car_number|string| |
|maker|string| |
|car_model|string| |
##### 商談テーブル(shodans)
|カラム名|型|備考|
|---|---|---|
|id|int||
|bb_no|int|index|
|last_name|varchar||
|frist_name|varchar(50)||
|ステータス|int||


####　検証内容
- tokenから車、商談を取得する際の方法について確認する。大きく分けて以下の二つで実験
  - tokenから取得した上でバリデーションを行う
  - 検索条件にtoken以外を入れる
-
