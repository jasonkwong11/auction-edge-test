class AuctionsController < ApplicationController

  def index
    if !params[:sort].blank?
      if params[:sort] == "Alphabetically"
        @auctions = Auction.by_alphabetical
      elsif params[:sort] == "Most Recent"
        @auctions = Auction.by_most_recent
      end
    else
      @auctions = Auction.all
    end
  end

  def import
    Auction.import(params[:file])
    redirect_to root_url, notice: "Auctions imported."
  end

  def new
    @auction = Auction.new
    @auction.vehicles.build
  end

  def create
   @auction = Auction.new(auction_params)
    if @auction.save
      flash[:notice] = "Auction created!"
      redirect_to @auction
    else
      render :new
    end
  end

  def show
    @auction = Auction.find(params[:id])
  end



private

  def auction_params
    params.require(:auction).permit(
      :name,
      :street_address,
      :city,
      :state,
      :zip,
      vehicles_attributes: [
        :year,
        :make,
        :model,
        :stock_number,
        :description,
        :winning_bid,
        :seller_payout
      ]
    )
  end
end
