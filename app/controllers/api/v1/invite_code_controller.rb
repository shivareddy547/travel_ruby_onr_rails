module Api
  module V1
    class InviteCodeController < GlobalApiController

      before_action :find_valid_coupon

      include ::V1::ControllerFunctions

      def valid
        find_valid_coupon
      end

      private

      def find_valid_coupon
        coupon = User.where(coupon_code: params[:coupon_code]).first
        coupon ? coupon_success : coupon_failure
      end

      def coupon_failure
        render json: coupon_invalid_message, status: :unprocessable_entity
      end

      def coupon_success
        render json: coupon_valid_message
      end

      def coupon_valid_message
        {
            status: true,
            message: 'Coupon is valid'
        }
      end

      def coupon_invalid_message
        {
            status: false,
            message: 'Coupon is invalid'
        }
      end
    end
  end
end
