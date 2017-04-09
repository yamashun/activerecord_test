class CarCallback

  SEND_ALL = %i(sell_user shop_user buy_user).freeze
  SEND_SELL = %i(sell_user).freeze

  def after_save(record)
    case true
    when record.on_sale?
      DeliverNoticeService.new(record).deliver_users(SEND_ALL)
    when record.stop?
      DeliverNoticeService.new(record).deliver_users(SEND_ALL)
    when record.agree?
      puts 'in agree'
    end
  end

end
