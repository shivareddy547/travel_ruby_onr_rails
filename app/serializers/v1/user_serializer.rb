class V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :team, :full_name, :coupon_code, :wallet_amount

  # has_one :hotel, serializer: ::V1::HotelSerializer

  def team
    object.team_name
  end

  def full_name
    object.full_name
  end
end