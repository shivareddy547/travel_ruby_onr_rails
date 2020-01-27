class V1::RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :short_name, :description, :short_description, :video_url ,:operating_hours,:opening_time,:closing_time,:location_name,:address,:latitude,:longitude,:extra_tips,:is_free,:is_free,:morning_ok,:afternoon_ok,:evening_ok,:midnight_ok,:adult_price,:senior_price,:senior_price,:child_price,:city,:phone_number,:category_names,
:activity_attachments
end
