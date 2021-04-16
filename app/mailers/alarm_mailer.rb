class AlarmMailer < ActionMailer::Base
  default from: "hogehoge@example.com"

  def send_confirm_to_user(user)
    @user = user
    mail(
      subject: "使用期限が近くなりましたのでお知らせ致します。",
      to: @user
    ) do |format|
      format.text
    end
  end

end
