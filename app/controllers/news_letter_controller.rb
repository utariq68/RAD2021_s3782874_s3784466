class NewsLetterController < ApplicationController

  def newsl
  end
  def newsletter
    @email = params[:email]
    # NewLetterMailer.signup_confirmation(@email).deliver()
    UserMailer.signup_confirmation(@email).deliver
        
    redirect_to root_path
  end

  
end
