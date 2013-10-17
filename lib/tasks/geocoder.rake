require 'dstk'

namespace :data do
  desc "get latitude and longitude for all bootcamps that don't have it"
  task :geocoder => :environment do
    Geocoder.get_lat_lon
  end
end

class Geocoder


  def self.get_lat_lon
    dstk = DSTK::DSTK.new
    Bootcamp.all.each do |bootcamp|
    begin
    geocode=dstk.geocode(bootcamp.full_location)
    bootcamp.lat=geocode["results"].first["geometry"]["location"]["lat"]
    bootcamp.lon=geocode["results"].first["geometry"]["location"]["lng"]
    bootcamp.save!
    rescue
    bootcamp.lat=0
    bootcamp.lon=0
    end
    bootcamp.save!
    end
    puts "#{bootcamp.name} set to #{bootcamp.lat} #{bootcamp.lon}\n"
    end
    @cities=Bootcamp.all.map { |camp| camp.city}
    @cities.each {|city| Bootcamp.num_in_city_index(city)}
  end
end
