class ApplicationController < ActionController::Base
  include ActionController::Serialization

  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :set_current_user
  
  private

  def authenticate_user!
    unauthorized! unless current_user
  end
  
  def unauthorized!
    head :unauthorized
  end

  def current_user
    @current_user
  end

  def set_current_user
    token = request.headers['Authorization'].to_s.split(' ').last
    # token = params['Authorization'].try(:last)
    return unless token
    payload = Token.new(token)

    @current_user = User.find(payload.user_id) if payload.valid?
  end
end
