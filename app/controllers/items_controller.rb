class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]
  
  
  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update 
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :cost_id, :prefecture_id, :ship_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    return redirect_to root_path if current_user != @item.user
  end


end


