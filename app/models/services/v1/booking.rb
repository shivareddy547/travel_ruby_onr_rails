module Services
  module V1
    class Booking

      ATTRIBUTES = [:hotel_id, :room_id, :user_id, :check_in, :check_out, :coupon_code, :use_wallet, :wallet_amount]

      attr_accessor *ATTRIBUTES
      COUPON_AMOUNT = 5.0
      RECEIVER_BONUS_AMOUNT = 2.0

      def initialize(options = {})
        assign_attributes(options.slice(*self.class::ATTRIBUTES))
      end

      def create
        booking = ::Booking.new(booking_params)
        if booking.save
          set_invite_history if coupon_code
          use_wallet_amount if wallet_changes?
          set_current_user_wallet
          true
        else
          false
        end
      end

      def booking_params
        {
            user_id: user_id,
            hotel_id: hotel_id,
            check_in: check_in,
            check_out: check_out,
            room_type: RoomType.where(id: room_id).first
        }
      end

      def set_invite_history
        @receiver = User.where(coupon_code: coupon_code).first
        invite = Invite.new(
          sender_id: @receiver.id, receiver_id: user_id,
          applied_at: Date.today, coupon_amount: COUPON_AMOUNT
        )
        invite.save
        set_wallet_history
      end

      def set_wallet_history
        wallet_histories = @receiver.wallet_histories
        previous_amount = wallet_histories.present? ? wallet_histories.last.previous_amount : 0.0
        current_amount = previous_amount + COUPON_AMOUNT
        user_wallet = wallet_histories.new(
          previous_amount: previous_amount, current_amount: current_amount,
          transaction_date: Date.today, transaction_code: 'invite', transaction_type: 1
        )
        if user_wallet.save
          @receiver.update(wallet_amount: current_amount)
        end
      end

      def set_current_user_wallet
        current_user = ::User.where(id:user_id).first
        current_user_wallets = current_user.wallet_histories
        previous_amount = current_user_wallets.present? ? current_user_wallets.last.previous_amount : 0.0
        current_amount =  current_user_wallets.present? ? current_user_wallets.last.current_amount : 0.0
        current_amount = current_amount + RECEIVER_BONUS_AMOUNT
        user_wallet = current_user_wallets.new(
          previous_amount: previous_amount, current_amount: current_amount,
          transaction_date: Date.today, transaction_code: 'bonus', transaction_type: 1
        )
        if user_wallet.save
          current_user.update(wallet_amount: current_amount)
        end
      end

      def use_wallet_amount
        current_user = ::User.where(id:user_id).first
        current_user_wallets = current_user.wallet_histories
        previous_amount = current_user_wallets.present? ? current_user_wallets.last.previous_amount : 0.0
        current_amount =  current_user_wallets.present? ? current_user_wallets.last.current_amount : 0.0
        current_amount = current_amount - wallet_amount.to_f
        user_wallet = current_user_wallets.new(
            previous_amount: previous_amount, current_amount: current_amount,
            transaction_date: Date.today, transaction_code: 'wallet_amount', transaction_type: 0
        )
        if user_wallet.save
          current_user.update(wallet_amount: current_amount)
        end
      end

      def assign_attributes(options = {})
        options.slice(*self.class::ATTRIBUTES).each do |key, value|
          send("#{key}=", value)
        end
      end

      def wallet_changes?
        use_wallet && wallet_amount.present?
      end

      def invite_code_type
        coupon_code.present? ? 'Invite' : 'Wallet Amount'
      end
    end
  end
end