class Bootcamp < ActiveRecord::Base
  attr_accessible :name, :address, :city, :st_pr, :country, :contact_email, :website_url, :lat, :lon, :twitter_handle, :description, :tag_list, :language_list

  has_many :tweets

extend FriendlyId
friendly_id :name , :use => :slugged

acts_as_taggable
acts_as_taggable_on :types



def full_location
  "#{address} #{city} #{st_pr} #{country}"
end

end

