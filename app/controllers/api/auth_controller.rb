class Api::AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email], username: params[:username])
    if user&.authenticate(params[:password])
      render json:{
        id: user.id,
        username: user.username,
        email: user.email
      }
    else
      render json: { message: 'Invalid username or password' }, status: :not_found
    end
  end
end
