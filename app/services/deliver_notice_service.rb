class DeliverNoticeService
  def initialize(car)
    @car = car
  end

  def deliver_users(targets)
    # @notice = Notice.new
    targets.each do |target|
      # targetが:sell_userの場合 @car.sell_user
      send_user = @car.__send__(target)
      if send_user
        puts "deliver #{target.to_s}"
        title_sym = (@car.status + '_' + target.to_s).to_sym

        # @notice.update(
        notice = Notice.new(
                    status:  @car.status,
                    email:   send_user.email,
                    title:   NOTICE_TITLES[title_sym],
                    message: NOTICE_TITLES[title_sym]
                    )
        notice.save
      end
    end
  end

end
