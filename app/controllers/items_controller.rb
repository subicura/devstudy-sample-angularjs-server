class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => [:create, :update]
  
  def index
    render :json => Item.all.order("id desc")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render :json => @item
    else
      render :json => nil
    end
  end

  def update
    if @item.update(item_params)
      render :json => @item
    else
      render :json => nil
    end
  end

  def destroy
    @item.destroy
    render :json => nil
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_type, :name, :price, :memo)
  end
end
