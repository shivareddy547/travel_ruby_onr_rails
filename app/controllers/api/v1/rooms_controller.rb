module Api
  module V1
    class RoomsController < ApiController
      
      before_action :find_hotel
      before_action :find_room_type, only: [:update, :show, :destroy]

      include ::V1::ControllerFunctions

      def index
        @room_types = @hotel.room_types.paginate(page: current_page, per_page: DEFAULT_NO_OF_PAGES)
        render json: response_data, status: 200, location: nil
      end

      def create
        @room_type = RoomType.new(permitted_room_params)

        if @room_type.save
          render json: @room_type, serializer: room_type_serializer, status: 201
        else
          render json: errors, status: 422
        end
      end

      def update
        if @room_type.update(permitted_update_room_params)
          render json: success_response_data, status: 200
        else
          render json: errors, status: 422
        end
      end

      def show
        render json: @room_type, serializer: room_type_serializer
      end

      def destroy
        if @room_type.destroy
          render json: success_response_data, status: 200
        else
          render json: errors, status: 422
        end
      end

      private

      def find_hotel
        @hotel = Hotel.find(params[:hotel_id])
      end

      def find_room_type
        @room_type = @hotel.room_type.find(params[:id])
      end

      def response_data
        {
            pagination_data: paginated_data,
            rooms_data: ActiveModelSerializers::SerializableResource.new(@room_types, each_serializer: room_type_serializer)
        }
      end

      def paginated_data
        {
            total_pages: @room_types.total_pages,
            per_page: @room_types.per_page,
            total_entries: @room_types.total_entries,
            current_page: @room_types.current_page
        }
      end

      def room_params
        params.require(:room)
      end

      def permitted_room_params
        room_params.permit(:name, :description, :include_breakfast, :is_active, :room_size, :bathroom_size, :bed_size, :no_of_adult, :no_of_child, :price).merge({ hotel: @hotel })
      end

      def permitted_update_room_params
        permitted_room_params
      end

      def errors
        { errors: @room_type.errors.full_messages.join(', ') }
      end

      def success_response_data

        {
            success: true,
            message: t('api.rooms.update_message')
        }
      end

    end
  end
end