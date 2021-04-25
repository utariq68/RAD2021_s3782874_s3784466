class NewsletterController < ApplicationController

  def newsletter
    @email = params[:user_email]
    NewsletterMailer.new_subscriber_email(@email).deliver
  end

end
