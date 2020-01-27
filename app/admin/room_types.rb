ActiveAdmin.register RoomType do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :include_breakfast, :is_active, :room_size, :bathroom_size, 
                :bed_size, :no_of_adult, :no_of_child, :price, :infant_age_limit, :capacity, :availability_units, :hotel_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :include_breakfast, :is_active, :room_size, :bathroom_size, :bed_size, :no_of_adult, :no_of_child, :hotel_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :id
    column :name
    column :hotel
    column :is_active
    actions
  end

  form do |f|
    f.inputs do
      f.input :hotel_id, :as => :select, :collection => Hotel.all
      f.input :name
      f.input :description, :as => :text, :input_html => { :class => 'autogrow', :rows => 10, :cols => 20  }
      f.input :include_breakfast
      f.input :room_size, :as => :select, :collection => RoomType.room_sizes.keys.to_a
      f.input :bathroom_size, :as => :select, :collection => RoomType.bathroom_sizes.keys.to_a
      f.input :bed_size, :as => :select, :collection => RoomType.bed_sizes.keys.to_a
      f.input :no_of_adult, :as => :select, :collection => (1..10)
      f.input :no_of_child, :collection => (1..10)
      f.input :price
      f.input :infant_age_limit
    end
    f.actions
  end
end
