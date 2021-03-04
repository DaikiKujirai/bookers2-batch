class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def new_registration_email(user)
    @user = user
    mail to: @user.email
    # この２行は必要
  end

end
