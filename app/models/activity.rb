require 'carrierwave/orm/activerecord'
class Activity < ApplicationRecord
	serialize :category_names,Array
	# has_many :categories
	before_save :set_hours
	has_many :activity_attachments
	accepts_nested_attributes_for :activity_attachments,:allow_destroy => true

	def set_hours
      # self.operating_hours = timediff(self.closing_time,self.opening_time)
    self.operating_hours =  "#{DateTime.parse(self.opening_time.to_s).strftime("%I:%M %p")} to #{DateTime.parse(self.closing_time.to_s).strftime("%I:%M %p")}" rescue 0
	end

	def timediff(start, endtime)
       ((start-endtime)/ 1.hour).round rescue 0
    end

    STATUS_VALUES = { 1 => 'Attractions', 2 => 'Sight Seeing', 3 => 'Adventure' , 4 => 'Wwalks pick', 5 =>'Free activities', 6 =>'Nature',7=> 'Cultural',8=>'Art',9=>'Family Fun',10=>'Night life',11=>'History',12=>'Shopping'}
   def categories
   	return STATUS_VALUES
   	# { 'One': 1, 'Two': 2, 'Three': 3 }
    # {'Attractions': 1,'Sight Seeing': 2,'Adventure': 3,'Wwalks pick': 4,'Nature' : 5,'Free activities' : 6,'Cultural' : 7,'Art' : 8,'Shopping' : 9,'Family Fun' : 10,'Night life' : 11,'History' :12 }
   end


  # attr_accessor   :names_raw

  # def names_raw
  #   self.names.join("\n") unless self.names.nil?
  # end

  # def names_raw=(values)
  #   self.names = []
  #   self.names=values.split("\n")
  # end

end
