ActiveAdmin.register Facility do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :price, :incl_charges, :is_active, :hotel_id, { :images => [] }
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :incl_charges, :is_active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #

  index do
    column :id
    column :name
    column :hotel
    column :is_active
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.semantic_errors *f.object.errors.keys, :class=>'inline-errors'
      f.input :hotel_id, :as => :select, :collection => Hotel.all.map {|u| [u.name.to_s, u.id]}
      f.input :name
      f.input :description, :as => :text, :input_html => { :class => 'autogrow', :rows => 10, :cols => 20  }
      f.file_field :images, multiple: true, :input_html => { :class => 'images_input' }
      f.input :incl_charges, as: :boolean
      f.input :price, :as => :number
      f.input :is_active, as: :boolean
    end
    f.actions
  end

end
