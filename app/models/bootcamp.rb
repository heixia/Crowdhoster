class Bootcamp < ActiveRecord::Base
  attr_accessible :name, :address, :weeks, :notes, :city, :st_pr, :country, :contact_email, :website_url, :lat, :lon, :twitter_handle, :description, :tag_list, :language_list, :hours, :tuition, :primary_language, :published, :hours_per_week

  has_many :tweets
  
  

extend FriendlyId
friendly_id :name , :use => :slugged

acts_as_taggable
acts_as_taggable_on :tags

scope :by_country, -> country {where(country: country)}

def self.published
  where(:published => true)
end

def self.canada
  where(:country => "Canada")
end

def self.united_states
  where(:country => %W(USA #{"United States"} US))
end

def self.ontario
  if self.canada
    where(:st_pr => %W(ON #{"Ontario"}))
  end
end

def self.british_columbia
  if self.canada
    where(:st_pr => %W(BC #{"British Columbia"}))
  end
end

def self.west_coast
  if self.united_states
    where(:st_pr => %W(CA OR WA))
  end
end

def self.east_coast
  if self.united_states
    where(:st_pr => %W(NY ME CT NJ VT MA PA NH RI))
  end
end

def self.mountain
  if self.united_states
    where(:st_pr => %W(ID WY UT NV CO MT))
  end
end

def self.southwest
  if self.united_states
    where(:st_pr => %W(AZ NM OK TX))
  end
end

def self.south
  if self.united_states
    where(:st_pr => %W(WV MD AR TN NC LA MS SC AL FL GA KY DE))
  end
end

def self.midwest
    if self.united_states
      where(:st_pr => %W(OH MO AZ IA WI MN KS NE IL IN MN ND SD))
    end
end

def self.rest_of_world
  where("country != ? and country != ?", "USA", "Canada")
end







def full_location
  "#{address} #{city} #{st_pr} #{country}"
end

# def self.total_count
#   Bootcamp.all.count
# end

def self.num_in_city(city)
  Bootcamp.where("city" => city).count
end

def self.num_in_city_index(city)
  @city_index=1
  @bootcamps=Bootcamp.where("city" => city)
  @bootcamps.each do |camp|
    camp.city_index=@city_index
    camp.save
    @city_index+=1
  end
end

def self.sum_tuition
  Bootcamp.sum(&:tuition)
end 

def self.sum_hours
  Bootcamp.sum(&:hours)
end

def self.avg_hours
  self.sum_hours/self.count
end

def self.avg_tuition
  self.sum_tuition/self.count
end

def cost_per_hour
  tuition/hours
end

def self.avg_cost_per_hour
  Bootcamp.sum(&:cost_per_hour)
end

end

