class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
  end

  def create
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:description, :price, :category)
  end
end
