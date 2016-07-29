class User < ApplicationRecord
  attr_accessor :is_avatar_removing
  mount_uploader :avatar, AvatarUploader

  validates :email, format: { with: /@/ }
end
