class GamesController < ApplicationController

  before_action :confirmed_logged_in


  def play

  end

  def make_new_game

    @title = params["name"]
    @user_id = params["user_id"]
    @players = params["players"]

    @game = Game.new(user_id: @user_id, title: @title)



    # {"utf8"=>"✓", "authenticity_token"=>"oAIz6U1bpe7O0bvkvrT49HLVhNcZooqs4cEI8kE8RkrKc0wZd9sAczaFslc7h8z5AuPXzutpinJoe7mh0gMMMw==", "tag_ids"=>["1", "17", "19"], "name"=>"My new game", "user_id"=>"{:value=>45}", "commit"=>"Create Game!", "controller"=>"games", "action"=>"make_new_game"}


    if @game.save
      @assignment = Assignment.new(user_id: @user_id, game_id: @game.id)
      @assignment.save
    end

    @players.each do |player|
      @assignment = Assignment.new(user_id: player, game_id: @game.id)
      @assignment.save
    end

    render("test")

  end


  def test
  end

	def index
		@games = Game.all
	end

	def new
		@game = Game.new
		@user_id = session[:user_id]

    @users = User.all

	end


  def show
    @user_id = session[:user_id]
    @game = Game.find(params[:id])

    # need to clean up the association here...
    @game_assignments = @game.assignments


  end

  def make_guess

  end


  def create
    @game = Game.new(game_params)



    if @game.save
      redirect_to game_path(@game)
    else
      render("new")
    end

  end

  def mygames


    @user_id = session[:user_id]

    @myuser = User.find(@user_id)

    @mygames = @myuser.games


    @games = Game.where(user_id: @user_id)


  end


  private

  def game_params
  	params.require(:game).permit(:title, :user_id)
  end

end
