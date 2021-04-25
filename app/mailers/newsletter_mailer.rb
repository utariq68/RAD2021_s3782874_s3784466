class NewsletterMailer < ApplicationMailer

  def new_subscriber_email(email)
    mail(to: email, subject: "Thank you for subscribing!")
  end
end
