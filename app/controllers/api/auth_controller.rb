class Api::AuthController < ApplicationController
  before_action :user_exists, except: [:login]

  def login
    user = User.where('username =? or email =?', params[:login], params[:login]).first

    if user&.authenticate(params[:password])
      token = encode_token(user.id)
      render json: {
        id: user.id,
        username: user.username,
        email: user.email,
        token: token
      }
    else
      render json: { message: 'Invalid username or password' }, status: :not_found
    end
  end
end
