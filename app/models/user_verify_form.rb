class UserVerifyForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :car_number

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :car_number, presence: true

  def verify?(token)
    # @token = find_by(token: token)
    @car = token.car if token
    @shodan = Shodan.find_by(bb_number: @car.bb_number) if @car
    @shodan && params_equals? && verify_complete(token)
  end



  def find_exhibit?(token)
    car = Car.token_verify_join(token.car_id, car_number, [first_name, last_name])
    car.present?
  end

  private
    def params_equals?
      verify_car && verify_shodan
    end

    def verify_car
      @car.car_number == self.car_number
    end

    def verify_shodan
      @shodan.first_name == self.first_name && @shodan.last_name == self.last_name
    end

    def verify_complete(token)
      token.status = 1
      token.save
    end

    def coulmn_name

    end

end
