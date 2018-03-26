class ReservationsController < ApplicationController
  def index
    @Reservations = Reservation.all
  end

  def new
    @Reservation = Reservation.new
  end

  def show
    @Reservation = Reservation.find(params[:id])
  end

  def edit
    @Reservation = Reservation.find(params[:id])
  end

  def create
    @Reservation = Reservation.new(reservation_params)
    if @Reservation.save
      redirect_to @Reservation
    else
      render :new
    end
  end

  def update
    @Reservation = Reservation.find(params[:id])
    if @Reservation = Reservation.update(reservation_params)
      redirect_to @Reservation
    else
      render :edit
    end
  end

  def destroy
      Item.destroy(params[:id])
      redirect_to @item
  end

private
  def reservation_params
    params.require(:Reservation).permit(:rent_start, :rent_end, :item_id, :buyer_id)
  end
end
