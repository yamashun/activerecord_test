class Car < ActiveRecord::Base
  has_one :shodan, primary_key: 'bb_number', foreign_key: 'bb_number'
  belongs_to :sell_user, class_name: 'User'
  belongs_to :shop_user, class_name: 'User'
  belongs_to :buy_user, class_name: 'User'
  # validates :car_number, format: {with: /\A\d[0-9A-Z]{0,2}\Z/} #分類番号
  # validates :car_number, format: {with: /\A\p{Hiragana}\Z/} #かな
  # validates :car_number, format: {with: /\A[･・0-9]{0,2}[ -]{0,1}[･・0-9]{0,1}[0-9]\z/} # ナンバー

  # after_save CarCallback.new(self)
  after_save CarCallback.new

  enum status: {
    on_sale: 1,
    stop:    2,
    agree:   3
  }

  scope :token_verify_join, ->(id, car_number, full_name){
    by_id(id).by_car_number(car_number).joins(:shodan).merge(Shodan.by_name full_name)
  }
  # scope :token_verify_subyquey, ->(car_number, full_name){
  #   joins(:shodan).merge(Shodan.by_name full_name).by_car_number(car_number)
  # }
  scope :by_id, ->(id){where(id: id)}
  scope :by_car_number, ->(car_number){where(car_number: car_number)}

  def non_number_trim str
    str.delete('^0-9')
  end

  def full_to_half str
    str.tr('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z')
  end

end
