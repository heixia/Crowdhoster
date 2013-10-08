class BootcampsController < ApplicationController

  def index 
    @bootcamps = Bootcamp.all
  end

  def show
    @bootcamp = Bootcamp.find(params[:id])
  end

  def new
    @bootcamp = Bootcamp.new
  end

  def create
    @bootcamp = Bootcamp.new(params[:bootcamp])
    if @bootcamp.save
      redirect_to @bootcamp, :notice => "Thanks for adding your bootcamp!"
    else
      render :action => 'new', :notice => "Oops! That didn't work."
  end

  def edit
    @bootcamp = Bootcamp.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
