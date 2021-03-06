class ConceptsController < ApplicationController

  before_action :confirmed_logged_in
  def create
  end

  def showconcepts

  	@user = User.find(session[:user_id])

  	@concepts = Concept.all

  	@user_rated_concepts = @user.concepts

  	@concepts = @concepts - @user_rated_concepts

  	@ratings = @user.ratings
    @user_ratings_count = @ratings.count

    #should initially be false, then after user completes 20 questions, please change
    @user_guessed = @user.rated

  	@unrated_concepts = @user_ratings
  	
  end

  def make_rating



    if params[:commit] == "Like"
      opinion = 1

    elsif params[:commit] == "Dislike"

      opinion = 2

    end

          user_id = params["user_id"]
      concept_id = params["concept_id"]
      explanation = params["explanation"]

  	Rating.create(user_id: user_id, concept_id: concept_id, opinion: opinion, explanation: explanation)

    
  	redirect_to(:action => "showconcepts")


  end



end
