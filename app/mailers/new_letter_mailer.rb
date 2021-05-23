class NewLetterMailer < ApplicationMailer
    default from: "rada1email123@gmail.com"

  def signup_confirmation(email)

    @email = email
    mail(:to => @email, :subject => 'Thanks for subscribing to The Generics Clothing newsletter!')
  end

  def forgot_password(email)
    @email = email
    @link = "https://b7c1ed184eec438b8efd84a5a110d5f5.vfs.cloud9.us-east-2.amazonaws.com/forgot/" + email
    mail(:to => @email, :subject => 'Forgot Password')
  end
end
