class Post < ApplicationRecord
  belongs_to :event
  has_many :comments
  has_many :users, through: :comments

  scope :select_posts, -> {select :id, :title, :body, :thumbnail, :event_id}
  scope :order_by, -> {order created_at: :desc}
end
