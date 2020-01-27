module Api
  module V1
    class BasicsModuleController < ApiController

      before_action :find_hotel, :check_valid_user

      include ::V1::ControllerFunctions

      def index
        render json: basic_datas, status: 200
      end

      private

      def find_hotel
        @hotel = current_user.hotel
      end

      def basic_datas
        {
          user_data:  ActiveModelSerializers::SerializableResource.new(current_user, each_serializer: user_serializer)
        }
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