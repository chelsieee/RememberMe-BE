class ApplicationController < ActionController::API
  before_action :user_exists

  def encode_token payload
    JWT.encode payload, nil, 'none'
  end

  def decode_token
    auth_token = request.headers['token']

    begin
      if auth_token
        decoded = JWT.decode auth_token, nil, false
      end
    rescue standardError
      p 'handleexception'
      nil
    end
  end

  def user_exists
    valid = decode_token
    if decode_token
      p "----valid----"
      p valid
      params[:loginUser_id] = valid[0]
      true
    else
      render json: { message: 'Unauthorised user, please login first' }, status: :unauthorized
    end
  end

end
