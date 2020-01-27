class AddMultipleFieldsToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :is_coupon_exists, :boolean, :default => false
    add_column :hotels, :coupon_value, :string
    add_column :hotels, :coupon_description, :string
    add_column :hotels, :fact_of_hotel, :string
    add_column :hotels, :currency_code, :string
  end
end
