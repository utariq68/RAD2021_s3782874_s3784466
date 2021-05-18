class NewsLetterController < ApplicationController

  def newsletter
    @email = params[:user_email]

        if @email != nil

          existing = Subscriber.all.where(email: @email)

          if existing == nil

            new_subscriber = Subscriber.new(email: @email)
            new_subscriber.save
            NewLetterMailer.new_subscriber_email(@email).deliver

          end

        end
  end


end
