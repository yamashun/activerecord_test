class Car < ActiveRecord::Base
  has_one :shodan, primary_key: 'bb_number', foreign_key: 'bb_number'

  scope :token_verify_join, ->(id, car_number, full_name){
    by_id(id).by_car_number(car_number).joins(:shodan).merge(Shodan.by_name full_name)
  }
  # scope :token_verify_subyquey, ->(car_number, full_name){
  #   joins(:shodan).merge(Shodan.by_name full_name).by_car_number(car_number)
  # }
  scope :by_id, ->(id){where(id: id)}
  scope :by_car_number, ->(car_number){where(car_number: car_number)}

end
