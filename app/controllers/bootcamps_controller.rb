class BootcampsController < ApplicationController

  def index 
    if params[:tag]
      @bootcamps = Bootcamp.tagged_with(params[:tag])
    else
      @bootcamps=Bootcamp.all
    end
  end

  def show
    @bootcamp=Bootcamp.find(params[:id])
  end

  def new
    @bootcamp=Bootcamp.new
  end

  def edit
    @bootcamp=Bootcamp.find(params[:id])
  end

  def update
  end

  def destroy
  end



end
