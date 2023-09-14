class UserMailer < ApplicationMailer
  def welcome_email(current_user)
    @user = current_user
    mail(to: @user.email, subject: 'Welcome to Our App')
  end
end
