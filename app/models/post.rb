class Post < ApplicationRecord
  belongs_to :event
  has_many :comments
  has_many :users, through: :comments
end
