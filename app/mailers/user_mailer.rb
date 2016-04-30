class UserMailer < ApplicationMailer
  default from: 'buymycastletest@gmail.com'

  def welcomeUser(user)
    @users = user
    @url = 'http://www.google.com'
    mail(to: @users.email, subject: 'test welcome email')
  end
end
