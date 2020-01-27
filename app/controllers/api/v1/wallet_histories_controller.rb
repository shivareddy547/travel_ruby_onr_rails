module Api
  module V1
    class WalletHistoriesController < GlobalApiController

      include ::V1::ControllerFunctions

      before_action :find_user, only: [:index]

      def index
        @wallet_histories = @user.wallet_histories
        set_wallet_records
        wallet_history_response
      end

      private

      def set_wallet_records
        @wallet_results = []
        @wallet_histories.each do|wallet|
          @wallet_results.push(
            current_amount: wallet.current_amount,
            transaction_type: wallet.transaction_type,
            transaction_date: wallet.transaction_date,
            transaction_code: wallet.transaction_code
          )
        end
        @wallet_results
      end

      def wallet_history_response
        render json: { wallet_amount: @user.wallet_amount, wallet_history: @wallet_results, status: 200 }
      end

      def find_user
        @user = User.find(params[:user_id])
      end

      def handle_error
        render json: errors, status: 422
      end

    end
  end
end