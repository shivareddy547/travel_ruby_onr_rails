class Facility < ApplicationRecord
  belongs_to :hotel

  serialize :images, Array
  mount_uploaders :images, AvatarUploader

  validates :name, presence: true, length: { maximum: 255 }
  validates :hotel, presence: true
end
