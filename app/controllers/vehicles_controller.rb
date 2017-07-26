class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  before_action :set_auction, only: [:create, :show, :edit, :update, :destroy]

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = @auction.vehicles.new(vehicle_params)

    if @vehicle.save
      flash[:notice] = "Vehicle created!"
      redirect_to @auction
    else
      flash[:notice] = "Something went wrong. Please try again"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @vehicle.update(vehicle_params)
      flash[:notice] = "Vehicle updated!"
      redirect_to "/auctions/#{@auction.id}/vehicles/#{@vehicle.id}"
    else
      flash[:notice] = "Something went wrong. Please try again"
      render :edit
    end
  end

  def destroy
    @vehicle.destroy
    redirect_to @auction
  end

private

  def vehicle_params
    params.require(:vehicle).permit(:year, :make, :model, :stock_number, :description, :winning_bid, :seller_payout)
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def set_auction
    @auction = Auction.find(params[:auction_id])
  end
end
