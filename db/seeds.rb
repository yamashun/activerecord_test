# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

region = ['品川', '世田谷', '練馬', '杉並', '足立', '多摩', '八王子']
car_maker = ['トヨタ', '日産', '三菱', 'ホンダ', 'マツダ', 'スバル', 'スバル']
car_model = ['model1', 'model2','model3','model4','model5','model6', 'model7']

5000.times do |index|
  car = Car.create(
    bb_number: 10000101 + index,
    car_number: "東京#{region[rand(7)]}#{[*"あ".."を"].sample}#{[*10..99].sample}-#{[*100..999].sample}",
    maker: car_maker[rand(7)],
    car_model: car_model[rand(7)]
  )
  Token.create(
    car_id: car.id,
    token: SecureRandom.urlsafe_base64,
    expiration_date: DateTime.now + 1.week,
    status: nil
  )
  Shodan.create(
    bb_number: car.bb_number,
    first_name: 3.times.inject("") { |str| str.concat([*"ぁ".."ん"].sample)},
    last_name: 3.times.inject("") { |str| str.concat([*"ぁ".."ん"].sample)},
    status: 1
  )
end
