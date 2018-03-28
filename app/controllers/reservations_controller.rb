class ReservationsController < ApplicationController

  helper_method :format_datetime

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(item_id: params[:reservation][:item_id], rent_start: format_dropdown_start_date, rent_end: format_dropdown_end_date, buyer_id: session[:user_id])
    if @reservation.save
      redirect_to items_available_path
    else
      # @item = @reservation.item
      flash[:notice] = @reservation.errors.full_messages
      redirect_to "/items/#{params[:reservation][:item_id]}"
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(rent_start: format_dropdown_start_date, rent_end: format_dropdown_end_date)
      redirect_to user_path(session[:user_id])
    else
      render :edit
    end
  end

  def destroy
      Reservation.destroy(params[:id])
      redirect_to user_path(session[:user_id])
  end


  def format_datetime(date)
    date.strftime("%B %e, %Y")
  end

  private

    def format_dropdown_start_date
      dates = Array.new
      dates = params[:reservation].values
      dates[1] = '%02i' % dates[1] if dates [1].size == 1
      dates[0..2].join("-")
    end

    def format_dropdown_end_date
      dates = Array.new
      dates = params[:reservation].values
      dates[4] = '%02i' % dates[4] if dates [4].size == 1
      dates[3..5].join("-")
    end


end
