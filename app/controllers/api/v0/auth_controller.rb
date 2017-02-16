module Api::V0
  class Api::V0::AuthController < ApiController
    include CommonConcern

    def load_profile
      user = User.first
      render_success(user: user)
    end


    def authenticate
      @oauth = "Oauth::#{params['provider'].titleize}".constantize.new(params)     
      if @oauth.authorized?
        @user = User.from_auth(@oauth.formatted_user_data, current_user)
        if @user
          render_success(token: Token.encode(@user.id), user: @user)
        else
          render_error "This #{params[:provider]} account is used already"
        end
      else
        render_error("There was an error with #{params['provider']}. please try again.")
      end
    end
  end
end