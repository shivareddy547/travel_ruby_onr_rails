module V1::ControllerFunctions

  def hotel_serializer
    ::V1::HotelSerializer
  end

  def facility_serializer
    ::V1::FacilitySerializer
  end

  def room_type_serializer
    ::V1::RoomTypeSerializer
  end
  def activity_serializer
    ::V1::ActivitySerializer
  end

  def user_serializer
    ::V1::UserSerializer
  end

  def search_room_serializer
    ::V1::SearchRoomSerializer
  end

  def booking_serializer
    ::V1::BookingSerializer
  end

  def error_with_message(error_message, status)
    render json: { errors: error_message }, status: status
  end

  def response_with_error(message, status, *arg)
    error_with_message message, status
  end

  def bad_request_error
    response_with_error("Bad request#{". #{@message}" if @message}", 400)
  end

  def not_found_error(resource_class)
    response_with_error([resource_class, "not found"].join(' '), 404)
  end

  def response_status_ok
    head :ok
  end



end
