class OmniauthCallbacksController < ApplicationController

    def twitter
        # render plain: "Success!"
        redirect_to root_path
    end

end