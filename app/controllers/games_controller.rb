class GamesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    # We need to create a new game using the current user
    @game = Game.new(game_params)
    @game.user = @user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def authenticate_user!
    redirect_to new_user_session_path unless user_signed_in?
    @user = current_user
  end

  def game_params
    params.require(:game).permit(:name, :description, :price, :category, :user_id)
  end
end
