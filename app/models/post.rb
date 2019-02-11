class Post < ApplicationRecord
  belongs_to :event
  has_many :users, through: :comments
end
