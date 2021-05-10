class NewsLetterController < ApplicationController

  def newsletter
    @email = params[:user_email]

        if @email != nil
            NewLetterMailer.new_subscriber_email(@email).deliver
        end
  end

end
