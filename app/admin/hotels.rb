ActiveAdmin.register Hotel do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :address, :images, :far_from_mrt, :far_from_airport, :far_from_busstand,
                :star, :no_of_rooms, :is_active, :latitude, :longitude, :check_in, :check_out, :map_url,
                :fact_of_hotel, :coupon_value, :coupon_description, :terms_and_conditions, { :images => [] }
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :address, :location, :latitude, :longitude, :images, :far_from_mrt, :far_from_airport, :far_from_busstand, :star, :no_of_rooms, :is_active]
  #   permitted << :location if params[:action] == 'update'
  #   permitted
  # end
  #

  index do
    column :id
    column :name
    column :no_of_rooms
    column :is_active
    actions
  end

  form(:html => { :multipart => true }) do |f|
  f.inputs do
      f.semantic_errors *f.object.errors.keys, :class=>'inline-errors'
      f.input :name
      f.input :description
      f.input :address
      f.file_field :images, multiple: true, :input_html => { :class => 'images_input' }
      f.input :far_from_mrt, :as => :select, :collection => Hotel.far_from_mrts.keys.to_a
      f.input :far_from_airport, :as => :select, :collection => Hotel.far_from_airports.keys.to_a
      f.input :far_from_busstand, :as => :select, :collection => Hotel.far_from_busstands.keys.to_a
      f.input :star, :as => :select, :collection => Hotel.stars.keys.to_a
      f.input :no_of_rooms
      f.input :latitude
      f.input :longitude 
      f.input :map_url
      f.input :check_in
      f.input :check_out
      f.input :terms_and_conditions, :as => :text, :input_html => { :class => 'autogrow', :rows => 10, :cols => 20  }
      f.input :fact_of_hotel, :as => :text, :input_html => { :class => 'autogrow', :rows => 10, :cols => 20  }
      f.input :is_coupon_exists?, as: :boolean
      f.input :coupon_value
      f.input :coupon_description, :as => :text, :input_html => { :class => 'autogrow', :rows => 10, :cols => 20  }

    end
    f.actions
  end
  
end
