ActiveAdmin.register Activity do

  
permit_params :name, :short_name, :description, :short_description, :video_url, :hotel_id ,:operating_hours,:opening_time,:closing_time,:location_name,:address,:latitude,:longitude,:extra_tips,:is_free,:is_free,:morning_ok,:afternoon_ok,:evening_ok,:midnight_ok,:adult_price,:senior_price,:senior_price,:child_price,:city,:phone_number,:category_ids,:avatar,category_names:[],
:activity_attachments_attributes => [:avatar, :_destroy, :id]

index do |each_rec|
  column :attraction_id
  column :name
  column :short_name
  column :description
  column :short_description
  column :video_url
  column :name


  column "Image" do |activity|
	if activity.activity_attachments.present?
   activity.activity_attachments.map.with_index { |score,i| link_to image_tag(activity.activity_attachments[i].avatar.url(:thumb)), admin_activity_path(activity) }.compact
  end

 end


  column :operating_hours
  column :opening_time
  column :closing_time
  column :location_name
  column :address
  column :extra_tips
  column :evening_ok
  column :morning_ok
  column :afternoon_ok
  column :midnight_ok
  column :adult_price
  column :senior_price
  column :child_price
  column :city
  column :category_names
   actions
end




form(:html => { :multipart => true }) do |f|
    f.inputs do
		f.semantic_errors *f.object.errors.keys, :class=>'inline-errors'
		f.input :attraction_id ,:as=>:string
		f.input :name , :as => :string
		f.input :short_name, :as => :string
		f.input :description,:as => :text, :input_html => { :class => 'autogrow', :rows => 10, :cols => 20  }
		f.input :short_description,:as => :text, :input_html => { :class => 'autogrow', :rows => 10, :cols => 20  }
		f.input :video_url
	    f.has_many :activity_attachments,
	                 allow_destroy: true do |a|
	        # a.file_field :avatar

	      a.input :avatar, :as => :file, :hint => a.object.avatar.present? \
		    ? image_tag(a.object.avatar.url(:thumb))
		    : content_tag(:span, "no image uploaded")
		  a.input :avatar_cache, :as => :hidden 

	      end

		# f.input :operating_hours,:as => :number
		# f.input :opening_time, :as => :string, :input_html => {:class => "hasDatetimePicker"}

	 #    f.input :closing_time, as: :datetime_picker,
	 #                    datepicker_options: {
	 #                      min_date: 0.days.ago.to_date
	 #                      #max_date: "+1W +5D"
	 #                    }

	    f.input :opening_time, as: :date_time_picker, datepicker_options: { min_date: 0.days.ago.to_date },:input_html => {:class => "hasDatetimePicker"}
        f.input :closing_time,   as: :date_time_picker, datepicker_options: { min_date: 0.days.ago.to_date},:input_html => {:class => "hasDatetimePicker"}
		f.input :location_name,:as => :string
		f.input :address,:as => :text, :input_html => { :class => 'autogrow', :rows => 10, :cols => 20  }
		f.input :latitude
		f.input :longitude
		f.input :extra_tips
		f.input :is_free , as: :boolean
		f.input :morning_ok , as: :boolean
		f.input :afternoon_ok ,as: :boolean
		f.input :evening_ok, as: :boolean
		f.input :midnight_ok,as: :boolean
		f.input :adult_price,as: :number
		f.input :senior_price, as: :number
		f.input :child_price,as: :number
		# f.input :city
		f.label "City: "
		f.select(:city, ["Singapore","Hyderabad"].collect {|d| [d.to_s,d.to_s]}, {:include_blank => "Select"}, {:class => "some_class"} )
		f.input :phone_number
		# li "Categories at #{f.object.category_names}" unless f.object.new_record?
		f.label "Categories: "
		f.collection_check_boxes(:category_names, f.object.categories, :last, :last,:checked=>f.object.category_names) do |b| 
        b.label(class: "check_box") { b.check_box(checked: b.text, class: "add_margin") + b.text } 
		# f.collection_check_boxes(:category_names, { 'One': 1, 'Two': 2, 'Three': 3 }, :first, :first) do |b| 
  #       b.label(class: "check_box") { b.check_box(checked: b.value, class: "add_margin") + b.text } 
        # b.label(:"data-value" => b.value) { b.check_box + b.text }
        end
	end
f.actions
end


 show do
    attributes_table do
      row :attraction_id
      row :name
      row :short_name
      row :description
      row :short_description
      row :video_url
      row :operating_hours
      row :opening_time
      row :closing_time
      row :location_name
      row :address
      row :extra_tips
      row :evening_ok
      row :morning_ok
      row :afternoon_ok
      row :midnight_ok
      row :adult_price
      row :senior_price
      row :child_price
      row :city
      row :category_names
      row "Attachments" do |activity|
       	if activity.activity_attachments.present?
   activity.activity_attachments.map.with_index { |score,i| link_to image_tag(activity.activity_attachments[i].avatar.url(:small) ), admin_activity_path(activity) }.compact
  end
      end
    end
    active_admin_comments
  end

 


end
