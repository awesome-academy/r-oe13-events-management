class Category < ApplicationRecord
  has_many :user_settings
  has_many :category_events
  has_many :users, through: :user_settings
  has_many :events, through: :category_events
end
