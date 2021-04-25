class AlarmMailer < ActionMailer::Base
  default from: "hogehoge@example.com"

  def alarm_mail(user,items,states,today)
    @user = user
    @items = items
    @states = states
    @today = today
    mail(
      subject: "使用期限が近くなりましたのでお知らせ致します。",
      to: @user
    ) do |format|
      format.text
    end
  end

end
