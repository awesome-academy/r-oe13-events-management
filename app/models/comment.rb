class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true

  acts_as_tree order: "created_at DESC"
end
