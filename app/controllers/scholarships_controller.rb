class ScholarshipsController < ApplicationController

  def index
    @scholarships=Campaign.all
    @current_scholarships=Campaign.where("? < expiration_date", Time.zone.now)
    @past_scholarships=Campaign.where("expiration_date > Time.now")
  end

end
