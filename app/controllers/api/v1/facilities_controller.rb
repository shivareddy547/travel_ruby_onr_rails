class Api::V1::FacilitiesController < ApiController

  before_action :find_hotel

  before_action :find_facility, only: [:update, :show, :destroy]

  include ::V1::ControllerFunctions

  def index
    @facilities = @hotel.facility.paginate(page: current_page, per_page: DEFAULT_NO_OF_PAGES)
    render json: @facilities, meta: paginated_data,  status: 200
  end

  def create
    @facility = @hotel.facility.new(permitted_facility_params)

    if @facility.save
      render json: @facility, serializer: facility_serializer, status: 201
    else
      render json: errors, status: 422
    end
  end

  def update
    if @facility.update(permitted_update_facility_params)
      render json: success_response_data('update'), status: 200
    else
      render json: errors, status: 422
    end
  end

  def show
    render json: @facility, serializer: facility_serializer, status: 200
  end

  def destroy
    if @facility.destroy
      render json: success_response_data, status: 200
    else
      render json: errors, status: 422
    end
  end

  private

  def find_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end

  def find_facility
    @facility = @hotel.facility.find(params[:id])
  end

  def response_data
    {
        pagination_data: paginated_data,
        facilities: ActiveModel::Serializer::CollectionSerializer.new(@facilities, serializer: facility_serializer)
    }
  end

  def paginated_data
    {
        total_pages: @facilities.total_pages,
        per_page: @facilities.per_page,
        total_entries: @facilities.total_entries,
        current_page: @facilities.current_page
    }
  end

  def facility_params
    params.require(:facility)
  end

  def permitted_facility_params
    facility_params.permit(:name, :description, :price, :incl_charges, :images => []).merge({ hotel: @hotel })
  end

  def permitted_update_facility_params
    permitted_facility_params
  end

  def success_response_data(options = nil)
    message = (options == 'update') ? t('api.rooms.update_message') : t('api.rooms.destroy_message')
    {
        success: true,
        message: message
    }
  end

end