class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :create]
  before_action :find_item, only: [:index, :new, :create]
  before_action :require_login, only: [:index, :new, :create]
  before_action :check_seller, only: [:index, :new, :create]
  
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_integration = OrderIntegration.new
  end

  def new
    @order_integration = OrderIntegration.new
  end

  def create
    @order_integration = OrderIntegration.new(order_params)
    if @order_integration.valid?
      pay_item
      @order_integration.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_integration).permit(:postcode, :prefecture_id, :municipality, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def require_login
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "ログインが必要です。"
    end
  end

  def check_seller
    if current_user == @item.user
      # 出品者としてログインしている場合
      redirect_to root_path, alert: "出品者は購入できません。"
    elsif @item.order.present?
    # 商品が売却済みの場合
      redirect_to root_path, alert: "この商品は既に売却済みです。"
    end
  end
end
