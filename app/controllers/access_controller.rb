class AccessController < ApplicationController

  before_action :confirmed_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    @username = session[:username]
  end

  def login
  	# display login form
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



end
