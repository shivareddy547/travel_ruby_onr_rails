module Api
  module V1
    class BookingsController < ApiController

      before_action :find_hotel

      include ::V1::ControllerFunctions

      def create
        if booking.create
          render json: booking_success_response, status: :created
        else
          render json: booking_failure_response, status: :unprocessable_entity
        end
      end

      def index
        @bookings = current_user.booking_data.paginate(page: current_page, per_page: DEFAULT_NO_OF_PAGES)
        render json: response_data, each_serializer: booking_serializer, status: 200
      end

      private

      def find_hotel
        @hotel = Hotel.find(params[:hotel_id])
      end

      def find_valid_coupon
        coupon = User.where(coupon_code: params[:coupon_code]).first
        coupon_response_message unless coupon
      end

      def coupon_response_message
        render json: coupon_invalid_message, status: :unprocessable_entity
      end

      def booking_failure_response
        {
            status: false,
            message: "Unknown error"
        }
      end

      def coupon_invalid_message
        {
            status: false,
            message: "Coupon is invalid"
        }
      end

      def booking_success_response
        {
            status: true,
            message: "Room booked successfully"
        }
      end

      def permitted_params
        params.permit(:check_in, :check_out, :coupon_code, :room_id => []).merge({ hotel_id: @hotel.id, user_id: current_user.id })
      end

      def booking
        service.new(permitted_params)
      end

      def service
        ::Services::V1::Booking
      end

      def response_data
        {
            pagination_data: paginated_data,
            bookings_data: ActiveModelSerializers::SerializableResource.new(@bookings, each_serializer: booking_serializer)
        }
      end

      def paginated_data
        {
            total_pages: @bookings.total_pages,
            per_page: @bookings.per_page,
            total_entries: @bookings.total_entries,
            current_page: @bookings.current_page
        }
      end

    end
  end
end
