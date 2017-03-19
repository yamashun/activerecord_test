class Shodan < ActiveRecord::Base

  has_one :car, primary_key: 'bb_number', foreign_key: 'bb_number'

  scope :by_name, ->(full_name){
    by_first_name(full_name[0]).by_last_name(full_name[1]).select(:bb_number)
  }

  scope :by_first_name, ->(first_name){where(first_name: first_name)}
  scope :by_last_name, ->(last_name){where(last_name: last_name)}

end
