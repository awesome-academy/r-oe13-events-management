class User < ApplicationRecord
  extend Devise::Models
  before_validation :set_default_role, on: :create
  belongs_to :role
  delegate :name, to: :role, prefix: :role, allow_nil: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :user_settings
  has_many :categories, through: :user_settings
  has_many :user_events
  has_many :notifications
  has_many :events, through: %i(user_events notifications)
  has_many :comments
  has_many :posts, through: :comments
  mount_uploader :avatar, AvatarUploader
  scope :not_current_user, -> (current_user_id){where.not id: current_user_id}
  validate  :avatar_size

  def check_role role
    self.role_name == role
  end

  private
  def avatar_size
    if avatar.size > Settings.avatar_size_max.megabytes
      errors.add :avatar, I18n.t("file_less_than")
    end
  end

  def set_default_role
    self.role ||= Role.find_by_name(Settings.role_member)
  end
end
