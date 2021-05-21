class NewLetterMailer < ApplicationMailer
    default from: "rada1email123@gmail.com"

  def signup_confirmation(email)

    @email = email
    mail(:to => @email, :subject => 'Thanks for subscribing to The Generics Clothing newsletter!')
  end
end
