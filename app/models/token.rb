class Token < ActiveRecord::Base
  belongs_to :car

  def still_valid?
    status.blank? && Time.now < expiration_date
  end
end
