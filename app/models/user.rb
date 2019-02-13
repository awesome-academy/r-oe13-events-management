class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :user_settings
  has_many :categories, through: :user_settings
  has_many :user_events
  has_many :notifications
  has_many :events, through: %i(user_events notifications)
  has_many :comments
  has_many :posts, through: :comments
  belongs_to :role
  mount_uploader :avatar, AvatarUploader
  validate  :avatar_size
  delegate :name, to: :role, prefix: :role, allow_nil: true

  private

  def avatar_size
    if avatar.size > Settings.avatar_size_max.megabytes
      errors.add :avatar, I18n.t("file_less_than")
    end
  end
end
