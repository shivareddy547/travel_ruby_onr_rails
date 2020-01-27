module Api
  module V1
    class UsersController < ApiController

      skip_before_action :authenticate_request, only: [:create], raise: false

      include ::V1::ControllerFunctions

      def create
        if required_params?(*require_params)
          if create_user.create == true
            render json: user_success_message
          else
            render json: user_failure_message, status: :unprocessable_entity
          end
        end
      end

      def index
        render json: current_user, serializer: user_serializer, status: 200
      end

      private

      def user_success_message
        {
            status: true,
            message: 'User created successfully'
        }
      end

      def user_failure_message
        {
            status: false,
            message: 'Unknown error'
        }
      end

      def create_user
        service_signup.new(params)
      end

      def service_signup
        ::Services::V1::User::Signup
      end

      def require_params
        %w(platform email password password_confirmation)
      end

      def response_users
        user_data.new(create_user.user,params.merge({user_serializer: user_serializer}))
      end

      def user_data
        ::Services::V1::User::Response
      end

    end
  end
end
