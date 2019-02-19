class Post < ApplicationRecord
  belongs_to :event
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  mount_uploader :thumbnail, ThumbnailUploader
  validate :thumbnail_size
  validates :body, presence: true
  
  scope :select_posts, -> {select :id, :title, :body, :thumbnail, :event_id}
  scope :order_by, -> {order created_at: :desc}
  
  private

  def thumbnail_size
    if thumbnail.size > Settings.thumbnail_size_max.megabytes
      errors.add :thumbnail, I18n.t("file_less_than")
    end
  end
end
