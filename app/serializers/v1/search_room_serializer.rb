class V1::SearchRoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  has_many :room_types, serializer: ::V1::RoomTypeSerializer
end