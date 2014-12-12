class Article < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :avatar, AvatarUploader
  validates :title, presence: true
  validates :content, presence: true
end
