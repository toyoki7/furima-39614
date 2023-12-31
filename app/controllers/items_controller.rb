class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :check_seller, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update]

  def index
    @items = Item.order(created_at: :desc)
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
  end

  def edit
    if @item.order.present? || current_user != @item.user
      # 商品が売却済みまたは出品者ではない場合
      redirect_to root_path, alert: "この商品は編集できません。"
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path, notice:
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end
  private

  def item_params
    params.require(:item).permit(:item, :image, :explanation, :category_id, :condition_id, :burden_id, :prefecture_id, :until_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def check_seller
    @item = Item.find(params[:id])
    unless @item.user. == current_user
      redirect_to root_path, alert: "出品者以外のユーザーはアクセスできません。"
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
