class UsersController < ApplicationController

  before_action :confirmed_logged_in, :except => [:new, :index, :create, :show]
	
  def index
		@users = User.all
	end

	def new
		@user = User.new

	end


  def show
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
    puts "        "
        puts "        "
            puts "        "
                puts "        "
                    puts "        "
    puts "THESE ARE THE PARAMS", params
        puts "     ***   "
        puts "       **** "
            puts "       **** "
                puts "        "
                    puts "        "
                    puts params["user"]["game_id"]



    if @user.save
           found_user = User.find(@user.id)
            authorized_user = found_user.authenticate(params["user"]["password"])
            Assignment.create(user_id: @user.id, game_id: params["user"]["game_id"])

#      if user_params[:username].present? && user_params[:password].present?
#        found_user = User.where(:name => user_params[:username]).first
#        flash[:notice] =  "that dint work"
#        if found_user

#        end
#      end

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
      render("new")
    end

  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end

end
