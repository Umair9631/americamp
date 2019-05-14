class AgentMailer < ApplicationMailer
  default :from => '"AmeriCamp" <hello@americamp.com>'

  def new_account user, password
    @user     = user
    @password = password
    mail(to: user.email, subject: "Your account has been created.")
  end
end
