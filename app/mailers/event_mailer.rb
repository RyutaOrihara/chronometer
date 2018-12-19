class EventMailer < ApplicationMailer
  def event_mail(participation)
    @participation = participation
    mail to: @participation.event.user.email, subject: "イベント参加通知メール"
  end
end
