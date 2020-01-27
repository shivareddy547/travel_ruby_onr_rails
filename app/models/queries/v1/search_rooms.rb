module Queries
  module V1
    class SearchRooms

      attr_accessor :search_rooms, :no_of_child, :no_of_adult

      def initialize(options = {})
        self.no_of_adult = options[:no_of_adult]
        self.no_of_child = options[:no_of_child]
      end

      def query
        # rooms = RoomType.all.joins(:hotel)
        # rooms = rooms.where('room_types.no_of_adult <= ?', no_of_adult) if no_of_adult.present?
        # rooms = rooms.where('room_types.no_of_child <= ?', no_of_child) if no_of_child.present?
        # rooms
        # Hotel.where(id: rooms.pluck(:id).uniq) if rooms.present?
        # Hotel.includes(:room_types).where(:room_types => {no_of_adult: no_of_adult, no_of_child: no_of_child})
        Hotel.all
      end

    end
  end
end