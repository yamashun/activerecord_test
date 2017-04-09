class Notice < ActiveRecord::Base
  after_save :send_notice

  def mail_send
    send_notice
  end

  private
    def send_notice
      logger.debug "send_notice:#{self.title}"
      NoticeMailer.change_notice(self).deliver_later(wait: 10.seconds)
    end
end
