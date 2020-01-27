class RestaurantAttachment < ApplicationRecord
   mount_uploader :avatar, AvatarUploader
   belongs_to :restaurant
end
