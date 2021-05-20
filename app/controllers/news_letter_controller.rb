class NewsLetterController < ApplicationController

  def newsl
  end
  def newsletter
    @email = params[:email]
    # NewLetterMailer.signup_confirmation(@email).deliver()
    UserMailer.signup_confirmation(@email).deliver
        # if @email != nil

        #   existing = Subscriber.all.where(email: @email)

        #   if existing == nil

        #     new_subscriber = Subscriber.new(email: @email)
        #     new_subscriber.save
        #     NewLetterMailer.new_subscriber_email(@email).deliver

        #   end

        # end
    redirect_to root_path
  end

end
