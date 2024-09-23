class SessionsController < ApplicationController
    # Sign in a user
    def create
      @user = User.find_by(name: params[:name])
      if @user&.authenticate(params[:password])
        session[:user_id] = @user.id
        render json: { message: 'Signed in successfully' }, status: :ok
      else
        render json: { error: 'Invalid name or password' }, status: :unauthorized
      end
    end
  
    # Sign out the user
    def destroy
      session[:user_id] = nil
      render json: { message: 'Signed out successfully' }, status: :ok
    end
  end
  