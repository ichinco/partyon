class InvitationMailer < ActionMailer::Base
  default from: "from@heroku.com"

  def invitation_email(invitation)
    @invitation = invitation
    mail(to: @invitation.email, subject: 'You have been invited to #{@invitation.trip.title}')
  end
end
