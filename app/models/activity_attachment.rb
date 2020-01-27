class ActivityAttachment < ApplicationRecord

   mount_uploader :avatar, AvatarUploader
   belongs_to :activity
end
