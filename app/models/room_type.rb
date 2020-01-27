class RoomType < ApplicationRecord
  belongs_to :hotel

  # has_and_belongs_to_many :bookings, inverse_of: :room_types

  validates :name,:room_size,:bathroom_size,:bed_size,:no_of_adult, :no_of_child, presence: true
  validates :name, length: { maximum: 255 }

  enum room_size: [:double, :single]

  enum bathroom_size: [:large,:medium]

  enum bed_size: [:king, :queen, :single, :twin],_prefix: :bed

  def minimized_information(options = {})
    {
        name: name,
        room_size: room_size,
        bathroom_size: bathroom_size,
        bed_size: bed_size
    }
  end
end


