class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: {message: 'User already exists'}
  validates :email, uniqueness: {message: 'email address already exists'}


end