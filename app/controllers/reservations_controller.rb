class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new(item_id: params[:reservation][:item_id], rent_start: formatted_start_date, rent_end: formatted_end_date, buyer_id: session[:user_id])
    if @reservation.save
      redirect_to items_available_path
    else
      redirect_to "/items/#{params[:reservation][:item_id]}"
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation = Reservation.update(reservation_params)
      redirect_to @reservation
    else
      render :edit
    end
  end

  def destroy
      Item.destroy(params[:id])
      redirect_to @item
  end

  private

    def formatted_start_date
      dates = Array.new
      dates = params[:reservation].values
      dates[1] = '%02i' % dates[1] if dates [1].size == 1
      dates[0..2].join("-")
    end

    def formatted_end_date
      dates = Array.new
      dates = params[:reservation].values
      dates[4] = '%02i' % dates[4] if dates [4].size == 1
      dates[3..5].join("-")
    end

end
