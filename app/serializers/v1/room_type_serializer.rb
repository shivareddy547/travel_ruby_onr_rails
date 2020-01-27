class V1::RoomTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :include_breakfast, :room_size, :bathroom_size, :bed_size, :no_of_adult,
             :no_of_child, :price, :infant_age_limit, :capacity, :availability_units
end
