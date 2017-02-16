module Api::V0
  class Api::V0::UsersController < ApiController
    before_action :authenticate_user!

    include CommonConcern

    def user_detail
      user = current_user
      render_success(user: user)
    end
  end
end