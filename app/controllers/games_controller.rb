class GamesController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create edit update destroy]
  before_action :set_game, only: %i[show edit update destroy]

  def index
    if params[:search].present?
      @games = Game.where("name ILIKE ?", "%#{params[:search]}%")
    else
      @games = Game.all
    end
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
    @user = current_user
    @order = Order.new
  end

  def edit; end

  def update
    @games.update(game_params)
    redirect_to games_path(@games)
  end

  def destroy
    @game.destroy
    redirect_to games_path notice: "Game was successfully destroyed.", status: :see_other
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def authenticate_user!
    redirect_to new_user_session_path unless user_signed_in?
    @user = current_user
  end

  def game_params
    params.require(:game).permit(:name, :description, :price, :category, :user_id, :image)
  end
end
