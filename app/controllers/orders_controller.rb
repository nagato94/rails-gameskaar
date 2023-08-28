class OrdersController < ApplicationController
  def index

  end

  def new
    @order = Order.new
  end

  def create
    @order = Orders.new(order_params)
    if @order.save
      redirect_to order_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  private

  def order_params
    params.require(:order).permit(:comment, :price, :game_id)
  end
end
