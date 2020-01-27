module Api
  module V1
    class HotelsController < ApiController

      include ::V1::ControllerFunctions

      before_action :find_hotel, only: [:show, :update, :destroy]

      def index
        @hotels = Hotel.all.paginate(page: current_page, per_page: DEFAULT_NO_OF_PAGES)
        render json: response_data, status: 200
      end

      def show
        render json: @hotel, serializer: hotel_serializer, status: 200
      end

      private
      def response_data
        {
            pagination_data: paginated_data,
            hotels_data: ActiveModel::Serializer::CollectionSerializer.new(@hotels, serializer: hotel_serializer)
        }
      end

      def paginated_data
        {
            total_pages: @hotels.total_pages,
            per_page: @hotels.per_page,
            total_entries: @hotels.total_entries,
            current_page: @hotels.current_page
        }
      end

      def hotel_params
        params.require(:hotel)
      end

      def find_hotel
        @hotel = Hotel.find(params[:id])
      end

      def handle_error
        render json: errors, status: 422
      end

    end
  end
end