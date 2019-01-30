class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :categories, through: :user_settings
  has_many :events, through: %i(user_events notifications)
  has_many :post, through: :comments
end
