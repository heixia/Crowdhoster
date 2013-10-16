class BootcampsController < ApplicationController

before_filter :authenticate_user!, only: [:edit, :new, :destroy]
  
  def index 
    @bootcamps = Bootcamp.published
    if params[:tag]
      @bootcamps = Bootcamp.published.tagged_with(params[:tag])
    else
      @bootcamps=Bootcamp.published
    end
  end

  def show
    @bootcamp = Bootcamp.find(params[:id])
    @bootcamps = Bootcamp.published
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
  end

  def edit
    @bootcamp = Bootcamp.find(params[:id])
  end

  def update
    @bootcamp = Bootcamp.find(params[:id])
    if @bootcamp.update_attributes(params[:bootcamp])
      flash[:notice] = "Successfully updated bootcamp."
    end
    redirect_to(@bootcamp)
  end

  def destroy
    @bootcamp = Bootcamp.find(params[:id])
    @bootcamp.destroy
      flash[:notice] = "Successfully destroyed bootcamp"
      redirect_to(@bootcamp)
  end

  def statistics
    @bootcamps=Bootcamp.all

    respond_to do |format|
      format.html 
      format.json { render :json => @bootcamps }
    end
  end  

end
