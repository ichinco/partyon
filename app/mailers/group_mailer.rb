class GroupMailer < ActionMailer::Base
  default from: "from@example.com"

  def invitation_email(message)
    @message = message
    @recipients = @message.trip.trip_users.map do |tu|
      tu.user.email
    end

    mail(to: @recipients,
         from: @message.user.email,
         subject: @message.subject)
  end
end
