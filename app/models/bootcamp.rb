class Bootcamp < ActiveRecord::Base
  attr_accessible :name, :address, :city, :st_pr, :country, :contact_email, :website_url, :lat, :lon, :twitter_handle, :description, :tag_list, :language_list, :hours, :tuition

  has_many :tweets

extend FriendlyId
friendly_id :name , :use => :slugged

acts_as_taggable
acts_as_taggable_on :types



def full_location
  "#{address} #{city} #{st_pr} #{country}"
end

def self.total_count
  Bootcamp.all.count
end

def self.sum_tuition
  sum = 0
  Bootcamp.all.each do |camp|
    sum += bootcamp.tuition if bootcamp.tuition != nil
  end
  return sum
end 

def sum_hours
  sum=0
  Bootcamp.all.each do |camp|
    sum += bootcamp.hours if bootcamp.hours != nil
  end
  return sum
end

def self.avg_hours
  self.sum_hours/self.total_count
end

def self.avg_tuition
  sum_tuition/total_count
end

def cost_per_hour
  tuition/hours
end

def self.avg_cost_per_hour
  sum=0
  Bootcamp.all.each do |camp|
    sum+= camp.cost_per_hour if camp.cost_per_hour != nil
  end
  return sum
end
end

