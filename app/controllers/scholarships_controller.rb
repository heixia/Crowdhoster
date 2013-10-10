class ScholarshipsController < ApplicationController

  def index
    @scholarships=Campaign.all
  end
  
end
