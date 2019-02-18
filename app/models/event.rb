class Event < ApplicationRecord
  has_many :category_events
  has_many :categories, through: :category_events
  has_many :user_events
  has_many :notifications
  has_many :users, through: %i(user_events notifications), foreign_key: "create_by"
  has_many :donations
  has_many :posts
  has_many :event_places
  has_many :place, through: :event_places

  scope :select_events, -> {select :id, :name}
end
