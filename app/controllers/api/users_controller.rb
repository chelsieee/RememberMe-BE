# frozen_string_literal: true

class Api::UsersController < ApplicationController
  before_action :user_exists, except: [:create]

  def index
    render json: User.all.map { |user|
      {
        id: user.id,
        username: user.username,
        email: user.email
      }
    }
  end

  def create
    user = User.create(user_params)
    if user.valid?
      render json: { message: "account #{user.username} has been created" }, status: 201
    else
      render json: { message: 'Unable to create account' }, status: 500
    end
  end

  def update
    user = User.find(params[:id]).update(user_params)
    if user
      render json: { message: 'account information has been updated' }, status: 201
    else
      render json: { message: 'Unable to update account' }, status: 500
    end
  end

  def show
    user = User.find(params[:id])
    p user
    if user.valid?
      render json: {
        username: user.username,
        email: user.email
      }
    else
      render json: { message: 'Unable to query account' }, status: 500
    end
  end

  def destroy
    User.find(params[:id]).destroy
    render json: { message: 'account has been deleted' }, status: 500
  end

  def user_params
    params.permit(:username, :email, :password)
  end
end

