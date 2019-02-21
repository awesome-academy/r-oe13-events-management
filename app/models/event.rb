class Event < ApplicationRecord
  has_many :category_events
  has_many :categories, through: :category_events
  has_many :user_events
  has_many :notifications
  has_many :users, through: %i(user_events notifications), foreign_key: "create_by"
  has_many :donations
  has_many :posts
  has_many :event_places, dependent: :destroy
  belongs_to :place, dependent: :destroy
  # belongs_to :places, through: :event_places, dependent: :destroy
  accepts_nested_attributes_for :place
  mount_uploader :banner, BannerUploader
  validate :banner_size
  validates :banner, presence: true

  scope :select_events, -> {select :id, :name}
  scope :event_index, -> {select :id, :banner, :start_date, :end_date, :name, :place_id}
  scope :order_desc, -> {order(created_at: :desc)}
  scope :load_myevent, -> myuser {where create_by: myuser}

  private

  def banner_size
    return errors.add(:banner, I18n.t("file_less_than")) unless banner.size < Settings.banner_size_max.megabytes
  end
end
