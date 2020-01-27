module Api
  module V1
    class RestaurantsController < ApiController
      skip_before_action :authenticate_request
      before_action :find_activity,only: [:show]

      include ::V1::ControllerFunctions

      def index
        # @room_types = @hotel.room_types.paginate(page: current_page, per_page: DEFAULT_NO_OF_PAGES)
        @activites  = Activity.all.paginate(page: current_page, per_page: DEFAULT_NO_OF_PAGES)
        render json: response_data, status: 200, location: nil
      end


      

      def show
        render json: @activity, serializer: activity_serializer
      end

      private

      def find_activity
        @activity = Activity.find(params[:id])
      end

     
      def response_data
        {
            pagination_data: paginated_data,
            activies_data: ActiveModelSerializers::SerializableResource.new(@activites, each_serializer: activity_serializer)
        }
      end

      def paginated_data       
        {
            total_pages: @activites.total_pages,
            per_page: @activites.per_page,
            total_entries: @activites.total_entries,
            current_page: @activites.current_page
        }
      end

      def errors
        { errors: @activity.errors.full_messages.join(', ') }
      end

      def success_response_data

        {
            success: true,
            message: t('api.activity.update_message')
        }
      end

    end
  end
end