class OrdersController < ApplicationController
  def index

  end

  def new

  end

  def create

  end

  def show

  end

  private

  def order_params
    params.require(:order).permit(:comment, :price, :game_id)
  end
end
