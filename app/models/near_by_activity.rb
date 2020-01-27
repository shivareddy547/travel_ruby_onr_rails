class NearByActivity < ApplicationRecord
  belongs_to :hotel

  serialize :images, Array
  mount_uploaders :images, AvatarUploader

  validates :name, presence: true, length: { maximum: 255 }
end
