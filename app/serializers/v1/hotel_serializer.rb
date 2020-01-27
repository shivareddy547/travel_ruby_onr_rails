class V1::HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :address, :far_from_airport, :far_from_busstand, :far_from_busstand,
             :star, :latitude, :longitude,:check_in, :check_out, :terms_and_conditions, :images, :map_url,
             :reviews, :ratings, :free_cancellation, :actual_price, :discount_price, :last_moment_deal,
             :last_booked_time, :fact_of_hotel, :currency_code, :is_coupon_exists?, :coupon_value,
             :coupon_description


  has_many :near_by_activity, serializer: ::V1::NearByActivitySerializer
  has_many :near_by_restaurant, serializer: ::V1::NearByRestaurantSerializer
  has_many :facility, serializer: ::V1::FacilitySerializer

  def check_in
    current_time_format(object.check_in)
  end

  def check_out
    current_time_format(object.check_out)
  end

  def images
    return [] unless object.images.present?

    images = []
    object.images.each do |img|
      images << img.url
    end
    images
  end

  def reviews
    rand(1250..5698)
  end

  def ratings
    '%.1f' % rand(2..5)
  end

  def free_cancellation
    [true, false].sample
  end

  def facilities
    object.facility.pluck(:name)
  end

  def actual_price
    @price ||= rand(2000..5500)
  end

  def discount_price
    @price - rand(100..500)
  end

  def last_moment_deal
    rand(2000..5500)
  end

  def last_booked_time
    return nil unless object.bookings.exists?

    object.bookings.last.check_in
  end

  private

  def current_time_format(time)
    return nil unless time && time.is_a?(Time)

    time.strftime("%I:%M %p")
  end

end
