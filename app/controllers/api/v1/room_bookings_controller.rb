module Api
  module V1
    class RoomBookingsController < GlobalApiController

      before_action :access_denied, only: [:index]
      before_action :find_user, :find_hotel, :find_valid_coupon, :check_wallet, only: [:create]

      include ::V1::ControllerFunctions

      def create
        if booking.create
          render json: booking_success_response, status: :created
        else
          render json: booking_failure_response, status: :unprocessable_entity
        end
      end

      def index
        @bookings = @user.booking_data.paginate(page: current_page, per_page: DEFAULT_NO_OF_PAGES)
        render json: response_data, each_serializer: booking_serializer, status: 200
      end

      private

      def find_hotel
        @hotel = Hotel.find(params[:hotel_id])
      end

      def access_denied
        @user = User.find_by_email(params[:email])
        render json: {
            status: false,
            message: 'Invalid access'
        }, status: :unprocessable_entity unless @user
      end

      def booking_failure_response
        {
            status: false,
            message: 'Unknown error'
        }
      end

      def booking_success_response
        {
            status: true,
            message: 'Room booked successfully'
        }
      end

      def permitted_params
        params.permit(:check_in, :check_out, :coupon_code, :use_wallet, :wallet_amount, :room_id => []).merge({ hotel_id: @hotel.id, user_id: @user.id })
      end

      def booking
        service.new(permitted_params)
      end

      def service
        ::Services::V1::Booking
      end

      def find_user
        user = User.find_by_email(params[:email])
        if user
          @user = user
        else
          user_params = {email: params[:email], password:  params[:email], password_confirmation:  params[:email]}
          service_signup.new(user_params).create
          @user = User.find_by_email(params[:email])
        end
      end

      def service_signup
        ::Services::V1::User::Signup
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

      def find_valid_coupon
        return true unless params[:coupon_code]

        coupon = User.where(coupon_code: params[:coupon_code]).first
        coupon_response_message unless coupon
      end

      def check_wallet
        return true unless params[:use_wallet]
        
        @user = User.find_by_email(params[:email])
        if params[:wallet_amount].to_f < @user.wallet_amount.to_f
          return true
        else
          render json: {
              status: false,
              message: "Your wallet amount don't have enough credit"
          }, status: :unprocessable_entity
        end
      end

    end
  end
end
