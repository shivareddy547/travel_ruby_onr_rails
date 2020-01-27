class V1::FacilitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :incl_charges, :price, :images

end