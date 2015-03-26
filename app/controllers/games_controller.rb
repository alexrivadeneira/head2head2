class GamesController < ApplicationController
	def index
		@games = Game.all
	end

	def new
		@game = Game.new()
	end


  def show
    @game = Game.find(params[:id])
  end


  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to user_path(@game)
    else
      render("new")
    end

  end

  private

  def game_params
  	params.require(:user).permit(:name, :email, :password)
  end

end
