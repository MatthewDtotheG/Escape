class ItemsController < ApplicationController

  def index
    if !params[:category].nil? && Item.all_categories.include?(params[:category])
      @items = Item.where(category: params[:category])
    else
      @items = Item.all
    end
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    byebug
    if @item.save
      redirect_to '/'
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item = Item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    Item.destroy(params[:id])
    redirect_to @item
  end

private

  def item_params
    params.require(:item).permit(:name, :description, :price, :seller_id, :category)
  end

end
