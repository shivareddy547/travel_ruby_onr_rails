module Api
  module V1
    class SearchRoomsController < GlobalApiController

      include ::V1::ControllerFunctions

      def search
      
         @search_rooms = search_room.query.paginate(page: current_page, per_page: DEFAULT_NO_OF_PAGES)
      
        render json: response_data, status: 200
      end

      private
      def response_data
        {
            pagination_data: paginated_data,
            hotels_data: ActiveModel::Serializer::CollectionSerializer.new(@search_rooms, serializer: hotel_serializer)
        }
      end

      def paginated_data
        {
            total_pages: @search_rooms.total_pages,
            per_page: @search_rooms.per_page,
            total_entries: @search_rooms.total_entries,
            current_page: @search_rooms.current_page
        }
      end

      
      def permitted_params
        params.require(:search_rooms)
      end

      def search_room
        room_query.new(params)
      end

      def room_query
        ::Queries::V1::SearchRooms
      end

    end
  end
end
