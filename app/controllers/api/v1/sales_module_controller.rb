module Api
  module V1
    class SalesModuleController < ApiController

      before_action :find_hotel, :check_valid_user

      include ::V1::ControllerFunctions

      def index
        render json: sales_module, status: 200
      end

      private

      def sales_module
        {
          no_of_visitors: rand(1...50),
          sales_across: rand(325...1900),
          revenue_today: rand(1...50),
          no_of_bookings_today: no_of_bookings,
          no_of_check_ins_today: no_of_check_ins,
          no_of_check_ins_tomorrow: no_of_check_ins_tomorrow,
          overall: rand(55..55000),
        }
      end

      def no_of_bookings
        @hotel.bookings.no_of_bookings_today.count
      end

      def no_of_check_ins
        @hotel.bookings.no_of_check_ins_today.count
      end

      def no_of_check_ins_tomorrow
        @hotel.bookings.no_of_check_ins_tomorrow.count
      end

      def find_hotel
        @hotel = Hotel.find(params[:hotel_id])
      end

      def user_can_access?
        current_user.is_admin?
      end

      def check_valid_user
        error_with_message 'You dont have access for this page !', :forbidden unless user_can_access?
      end

    end
  end
end