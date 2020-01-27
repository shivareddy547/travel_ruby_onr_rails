class SpatialLocValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    loc = record.send(attribute)
    longitude = loc.respond_to?(:x) ? loc.x : loc.is_a?(Hash) ? loc.with_indifferent_access[:x] : nil
    latitude = loc.respond_to?(:y) ? loc.y : loc.is_a?(Hash) ? loc.with_indifferent_access[:y] : nil
    if loc.present? && (!longitude || !longitude.between?(-180, 180) || !latitude || !latitude.between?(-90, 90))
      record.errors[attribute] << (options[:message] || "must be in valid ranges (Longitude -180 to 180) (Latitude: -90 to 90)")
    end
  end
end
