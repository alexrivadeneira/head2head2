class AccessController < ApplicationController

  before_action :confirmed_logged_in, :except => [:login, :attempt_login, :logout, :attempt_signup, :signup]

  def index
    @username = session[:username]
  end

  def login
  	# display login form
  end

  def signup
    @user = User.new

  end

  def attempt_signup
    # create the new user
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)

      found_user = User.find(@user.id)
      authorized_user = found_user.authenticate(user_params[:password])
       
        if authorized_user
            session[:user_id] = authorized_user.id
            session[:username] = authorized_user.name
            flash[:notice] = "You are now logged in"
            redirect_to(:action => "index")
          else
            flash[:notice] = "Invalid username/pw combo"
            redirect_to(:action => "index")
          end

    else
      render("signup")
    end
    

    # if the user is created, then log in
  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
  		found_user = User.where(:name => params[:username]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end

  	if authorized_user
        session[:user_id] = authorized_user.id
        session[:username] = authorized_user.name
  			flash[:notice] = "You are now logged in"
  			redirect_to(:action => "index")
  		else
  			flash[:notice] = "Invalid username/pw combo"
  			redirect_to(:action => "index")
  		end
  end



  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged Out"
    redirect_to(:action => "login")
  end

  private

    def user_params
    params.require(:user).permit(:name, :email, :password)
  end



end
