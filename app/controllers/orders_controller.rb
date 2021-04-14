class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :set_item
  def index
    @pay_form = PayForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @pay_form = PayForm.new(order_params)
    @item = Item.find(params[:item_id])
    if @pay_form.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @pay_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:pay_form).permit(:zip_code, :city, :address, :phone_number, :building, :prefecture_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    return redirect_to root_path if current_user == @item.user || @item.order.present?#論理演算子と条件文商品が売れていたら
  end

 def set_item
  @item = Item.find(params[:id])
 end



end
