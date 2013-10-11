class Bootcamp < ActiveRecord::Base
  attr_accessible :name, :address, :weeks, :notes, :city, :st_pr, :country, :contact_email, :website_url, :lat, :lon, :twitter_handle, :description, :tag_list, :language_list, :hours, :tuition, :primary_language

  has_many :tweets
  

extend FriendlyId
friendly_id :name , :use => :slugged

acts_as_taggable
acts_as_taggable_on :types



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

