class ConceptsController < ApplicationController

  before_action :confirmed_logged_in

  def showconcepts

  	@user = User.find(session[:user_id])

  	@concepts = Concept.all

  	@user_rated_concepts = @user.concepts

  	@concepts = @concepts - @user_rated_concepts

  	@ratings = @user.ratings
    @user_ratings_count = @ratings.count

    @user_guessed = false

  	@unrated_concepts = @user_ratings
  	
  end

  def make_rating
  	user_id = params["user_id"]
  	concept_id = params["concept_id"]
  	opinion = params["opinion"]
  	Rating.create(user_id: user_id, concept_id: concept_id, opinion: opinion)
  	
  	redirect_to(:action => "showconcepts")


  end



end
