class ConceptsController < ApplicationController

  before_action :confirmed_logged_in

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

    puts "      kfkasfkldkf jkdsfk ksdf",  params

    if params[:submit_name] == "like"
      opinion = 2

    elsif params[:submit_name] == "dislike"

      opinion = 1

    end

          user_id = params["user_id"]
      concept_id = params["concept_id"]
      explanation = params["explanation"]

  	Rating.create(user_id: user_id, concept_id: concept_id, opinion: opinion, explanation: explanation)

    
  	redirect_to(:action => "showconcepts")


  end



end
