class Hotel < ApplicationRecord
  has_one :bank_detail, dependent: :destroy
  has_many :near_by_activity, dependent: :destroy
  has_many :near_by_restaurant, dependent: :destroy

  has_many :facility, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :room_types, dependent: :destroy

  has_many :users, dependent: :destroy, inverse_of: :hotel

  validates :name,:address,:star,:far_from_mrt,:far_from_airport,:far_from_busstand, presence: true
  validates :name, length: { maximum: 255 }

  serialize :images, Array
  mount_uploaders :images, AvatarUploader


  enum star: { '1 Star' => 1, '2 Star' => 2, '3 Star' => 3, '4 Star' => 4, '5 Star'=> 5, '6 Star'=> 6 }

  enum far_from_mrt: { below_2kms: 1, below_5kms: 2, below_10kms: 3 }
  enum far_from_airport: { below_2kms: 1, below_5kms: 2, below_10kms: 3 },_prefix: :airport
  enum far_from_busstand: { below_2kms: 1, below_5kms: 2, below_10kms: 3 },_prefix: :busstand
end
