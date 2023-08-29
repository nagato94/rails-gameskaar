class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    @order.user = @user

    if @order.save
      redirect_to @order
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find params[:id]
  end

  private

  def authenticate_user!
    redirect_to new_user_session_path unless user_signed_in?
    @user = current_user
  end

  def order_params
    params.require(:order).permit(:user_id, :game_id)
  end
end
