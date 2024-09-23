class ApplicationController < ActionController::API
    before_action :authenticate_user
  
    private
  
    def authenticate_user
      @current_user = User.find(session[:user_id]) if session[:user_id]
      render json: { error: 'Unauthorized access' }, status: :unauthorized unless @current_user
    end
  end
  