ActiveAdmin.register BankDetail do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :account_holder_name, :account_number, :ifsc, :swft_bc, :description, :hotel_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :account_holder_name, :account_number, :ifsc, :swft_bc, :description, :hotel_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :id
    column :name
    column :account_holder_name
    column :hotel
    actions
  end

end
