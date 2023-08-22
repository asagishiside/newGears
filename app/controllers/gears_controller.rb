class GearsController < ApplicationController
  def index
    @gear = Gear.find(1)
    @gears = Gear.all
  end

  def show
    @gears = Gear.find(params[:id])
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
      params.require(:gear).permit(:name, :gear_type, :brand_id)
    end

end
