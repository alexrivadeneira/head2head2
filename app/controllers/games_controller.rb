class GamesController < ApplicationController

  before_action :confirmed_logged_in

	def index
		@games = Game.all
	end

	def new
		@game = Game.new
		@user_id = session[:user_id]
	end


  def show
    @game = Game.find(params[:id])
  end


  def create
    @game = Game.new(game_params)


    if @game.save
      redirect_to game_path(@game)
    else
      render("new")
    end

  end

  private

  def game_params
  	params.require(:game).permit(:title, :user_id)
  end

end
