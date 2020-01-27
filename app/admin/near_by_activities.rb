ActiveAdmin.register NearByActivity do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :hotel_id, { :images => []}
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :images, :hotel_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.semantic_errors *f.object.errors.keys, :class=>'inline-errors'
      f.input :hotel_id, :as => :select, :collection => Hotel.all.map {|u| [u.name.to_s, u.id]}
      f.input :name
      f.file_field :images, multiple: true, :input_html => { :class => 'images_input' }
    end
    f.actions
  end


end
