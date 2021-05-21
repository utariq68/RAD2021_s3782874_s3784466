class NewsLetterController < ApplicationController

<<<<<<< HEAD
  def newsletter
    @email = params[:user_email]

        if @email != nil
            NewLetterMailer.new_subscriber_email(@email).deliver
        end
  end

=======
  def newsl
  end
  def newsletter
    @email = params[:email]
    # NewLetterMailer.signup_confirmation(@email).deliver()
    UserMailer.signup_confirmation(@email).deliver
        
    redirect_to root_path
  end

  
>>>>>>> main
end
