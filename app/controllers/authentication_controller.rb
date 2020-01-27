class AuthenticationController < ApiController
  skip_before_action :authenticate_request
  include ::V1::ControllerFunctions

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
      render json: response_data.merge({ auth_token: command.result })
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private

  def user
   @user = User.find_by_email(params[:email])
  end

  def response_data
    result = {
        user:  ActiveModelSerializers::SerializableResource.new(user, each_serializer: user_serializer)
    }
    if user.hotel.present?
      result.merge!({ hotel: ActiveModelSerializers::SerializableResource.new(user.hotel, each_serializer: hotel_serializer) })
    end
    result
  end
end