class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate_current_user

  private

  def authenticate_current_user
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by_token(token)
    end
  end

  def require_authentication
    return if @current_user
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: {error: 'Not Authenticated', reason: 'Bad Credentials'}, status: 401
  end
end
