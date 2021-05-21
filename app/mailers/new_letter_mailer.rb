class NewLetterMailer < ApplicationMailer
<<<<<<< HEAD
    default :from => 'rada1email123@gmail.com'

    def new_subscriber_email(email)
    mail(:to => email, :subject => "Thank you for subscribing!")
    end
=======
    default from: "railscasts@example.com"

  def signup_confirmation(user)
    # @user = user
    email = user
    mail to: email, subject: "Subscribing to RD Clothing Newsletter"
  end
>>>>>>> main
end
