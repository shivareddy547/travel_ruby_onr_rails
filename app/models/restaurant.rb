class Restaurant < ApplicationRecord

	serialize :category_names,Array
	# has_many :categories
	before_save :set_hours
	has_many :restaurant_attachments
	accepts_nested_attributes_for :restaurant_attachments,:allow_destroy => true

	def set_hours
      # self.operating_hours = timediff(self.closing_time,self.opening_time)
      self.operating_hours =  "#{DateTime.parse(self.opening_time.to_s).strftime("%I:%M %p")} to #{DateTime.parse(self.closing_time.to_s).strftime("%I:%M %p")}" rescue 0

	end

	def timediff(start, endtime)
       ((start-endtime)/ 1.hour).round rescue 0
    end

    STATUS_VALUES = { 1 => 'Indian', 2 => 'Chinese', 3 => 'Thai' , 4 => 'Western', 5 =>'Italian', 6 =>'French',7=> 'Mexican',8=>'Malay',9=>'Editors Pick',10=>'Singaporean'}
   def categories
   	return STATUS_VALUES
   	# { 'One': 1, 'Two': 2, 'Three': 3 }
    # {'Attractions': 1,'Sight Seeing': 2,'Adventure': 3,'Wwalks pick': 4,'Nature' : 5,'Free activities' : 6,'Cultural' : 7,'Art' : 8,'Shopping' : 9,'Family Fun' : 10,'Night life' : 11,'History' :12 }
   end

end
