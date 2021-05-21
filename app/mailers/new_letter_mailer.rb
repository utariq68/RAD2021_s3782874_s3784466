class NewLetterMailer < ApplicationMailer
    default from: "railscasts@example.com"

  def signup_confirmation(user)
    # @user = user
    email = user
    mail to: email, subject: "Subscribing to RD Clothing Newsletter"
  end
end
