class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates :email, format: { with: /@/ }
end
