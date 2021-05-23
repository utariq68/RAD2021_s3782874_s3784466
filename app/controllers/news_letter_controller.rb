class NewsLetterController < ApplicationController

  def newsletter
    @email = params[:email]

    if @email != nil
      check = Subscriber.all.where(email: @email)

      if not check.exists?
        new_sub = Subscriber.new(email: @email)
        new_sub.save
      end

      NewLetterMailer.signup_confirmation(@email).deliver_now
      redirect_to root_path
    end

  end


end
