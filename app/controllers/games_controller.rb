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

      @players.each do |player|
      @assignment = Assignment.new(user_id: player, game_id: @game.id)
      @assignment.save
    end


      redirect_to(:action => "show", id: @game.id)
    end




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

    @user_to_update = User.find(@user_id)
    @user_to_update.update(rated: true)

    # need to clean up the association here...
    @game_assignments = @game.assignments


  end

  def make_guess
    actual_rating = Rating.find(params["rating_id"])
    actual_rating_outcome = actual_rating.opinion

    outcome_guess = params["outcome_guess"]

    guessing_user = params["user_id"]

    game_id = params["game_id"]


    if actual_rating_outcome.to_i == outcome_guess.to_i
      game_to_update = Game.find(game_id)
      game_to_update.total += 1
      game_to_update.save

      Guess.create(user_id: guessing_user, rating_id: actual_rating.id, outcome: true, game_id: game_id )
      user_update = User.find(guessing_user)
      user_update.average += 1
      user_update.save

      assignment_update = Assignment.where(user_id: guessing_user, game_id: game_id).first
      assignment_update.score += 1
      assignment_update.save

    else 
      Guess.create(user_id: guessing_user, rating_id: actual_rating.id, outcome: false, game_id: game_id )
    end


    redirect_to(:action => "show", :id => game_id)


    # get the rating info

    # compare it to what the user guessed
    # make a guess object
    # update the users score

    # a guess-rating pair must be unique -- cannot repeat, add validation

          # <%= form_tag(:action => "make_guess") do %>
          # <%= hidden_field_tag :user_id, @user_id %>
          # <%= hidden_field_tag :concept_id, rating.concept_id %>
          # <%= hidden_field_tag :rating_id, rating.id %>
          # <%= submit_tag("They liked") %>
          # <% end %><br>

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
