class GearsController < ApplicationController
  def index
    @gears = Gear.search(params[:name])
  end

  def show
    @gear = Gear.find(params[:id])
  end

  def new
    @gear = Gear.new
  end

  def create
    @gears = Gear.create(gear_params)
    if @gears.save
      redirect_to gears_new_path(@gear)
    else
      render 'new'
    end
  end

  private

    def gear_params
      params.require(:gear).permit(:name, :gear_type, :brand_id, images: [])
    end

end
