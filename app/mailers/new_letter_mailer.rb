class NewLetterMailer < ApplicationMailer
    default :from => 'rada1email123@gmail.com'

    def new_subscriber_email(email)
    mail(:to => email, :subject => "Thank you for subscribing!")
    end
end
