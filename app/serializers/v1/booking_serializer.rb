class V1::BookingSerializer < ActiveModel::Serializer
  attributes :id, :check_in, :check_out, :hotel, :status, :room_information

  has_one :user, serializer: ::V1::UserSerializer

  def hotel
    object.hotel.name
  end

  def room_information
    object.room_type.minimized_information({})
  end

  def status
    object.booking_status
  end

  def check_in
    current_datetime_format(object.check_in)
  end

  def check_out
    current_datetime_format(object.check_out)
  end

  private

  def current_datetime_format(time)
    return nil unless time && time.is_a?(Time)

    time.strftime("%d-%m-%Y %I:%M %p")
  end

end