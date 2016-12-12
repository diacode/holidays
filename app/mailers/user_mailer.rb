class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @password = user.password
    mail to: user.email, subject: "Welcome to the holidays app"
  end
end
