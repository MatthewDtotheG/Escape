class LocationsController < ApplicationController
  def index
    @Locations = Location.all
  end

  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location
    else
      render :new
    end
  end


private

  def location_params
    params.require(:location).permit(:name)
  end

end
