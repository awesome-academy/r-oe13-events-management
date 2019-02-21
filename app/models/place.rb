class Place < ApplicationRecord
  has_many :event_places
  has_many :events
end
