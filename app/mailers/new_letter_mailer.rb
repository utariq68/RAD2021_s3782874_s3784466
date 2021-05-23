class NewLetterMailer < ApplicationMailer
    default from: "rada1email123@gmail.com"

  def signup_confirmation(email)

    @email = email
    mail(:to => @email, :subject => 'Thanks for subscribing to The Generics Clothing newsletter!')
  end

  def forgot_password(email)
    @email = email
    @link = "https://blooming-chamber-97238.herokuapp.com/forgot/" + email
    mail(:to => @email, :subject => 'Forgot Password')
  end
end
