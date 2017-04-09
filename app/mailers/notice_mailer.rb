class NoticeMailer < ApplicationMailer
  def change_notice(notice)
    puts "change_notice:#{notice.message}"
    @message = notice.message
    mail(to: notice.email, subject: notice.title)
  end
end
