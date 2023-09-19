class GearsController < ApplicationController
  def index
    @gears = Gear.order(updated_at: :desc).limit(10)

    if params[:gear_type].present?
      @gears = @gears.where(gear_type: params[:gear_type])
    end

    if params[:name].present?
      escaped_name = ActiveRecord::Base.sanitize_sql_like(params[:name])
      @gears = Gear.where("name LIKE ?", "%#{escaped_name}%")
    end
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
