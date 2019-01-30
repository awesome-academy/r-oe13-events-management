class Event < ApplicationRecord
  has_many :categories, through: :category_events
  has_many :users, through: %i(user_events notifications), foreign_key: "create_by"
  has_many :donations
  has_many :posts
  has_many :place, through: :event_places
end
