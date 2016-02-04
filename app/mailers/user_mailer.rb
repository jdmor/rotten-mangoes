class UserMailer < ActionMailer::Base
  default from: "notifications@rottenmangoes.com"

  def account_deleted_email(user)
    @user = user
    mail(to: @user.email, subject: 'Rotten Mangoes Account Deleted')
  end
end
