class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def cancel_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Your Order has been cancelled.')
  end
end