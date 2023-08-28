class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new

  end

  def create

  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:comment, :price, :game_id)
  end
end
