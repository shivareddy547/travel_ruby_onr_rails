class V1::BankDetailSerializer < ActiveModel::Serializer
  attributes :name, :account_holder_name, :ifsc, :account_number, :swft_bc
end