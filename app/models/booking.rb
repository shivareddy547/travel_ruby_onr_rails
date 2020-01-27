class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :room_type

  validates :check_in, :check_out, :user, :hotel, :room_type, presence: true

  scope :no_of_bookings_today, -> {
    where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  }

  scope :no_of_check_ins_today, -> {
    where(check_in: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  }

  scope :no_of_check_ins_tomorrow, -> {
    where(check_in: Time.zone.now.beginning_of_day.tomorrow..Time.zone.now.end_of_day + 1)
  }

  # has_and_belongs_to_many :room_types, inverse_of: :bookings
  #

  def booking_status
    'Confirmed'
  end
end
