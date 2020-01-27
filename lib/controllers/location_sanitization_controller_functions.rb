module LocationSanitizationControllerFunctions
  def format_location_attr_to_long_lat_format(resource_params, location_attr)
    if resource_params && (loc_params = resource_params.delete(location_attr)).present?
      resource_params.merge!(location_attr => [loc_params[:longitude], loc_params[:latitude]])
    end
  end
end
