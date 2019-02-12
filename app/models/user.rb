class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :user_settings
  has_many :categories, through: :user_settings
  has_many :user_events
  has_many :notifications
  has_many :events, through: %i(user_events notifications)
  has_many :comments
  has_many :post, through: :comments
end
