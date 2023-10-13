class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_seller, only: [:edit, :update]

  def index
    @items = Item.order(:created_at)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item, :image, :explanation, :category_id, :condition_id, :burden_id, :prefecture_id, :until_id, :price).merge(user_id: current_user.id)
  end

  def check_seller
    @item = Item.find(params[:id])
    unless @item.user. == current_user
      redirect_to root_path, alert: "出品者以外のユーザーはアクセスできません。"
    end
  end
end
