class UsersController < ApplicationController

def index
	@users = User.all
end

def new
	@user = User.new
end

def create
	@user = User.create(user_params)
	if @user
		redirect_to user_path(@user)
		flash[:notice] = "Welcome to the fleet, sailor! You can now sign in."
	else
		render "new"
		flash[:alert] = "Avast! Your sign-in was hijacked by troublesome parties, me hearties."
	end
end

def show
	@user = User.find(params[:id])
	@fleet = Boat.where(user_id: @user.id)
	@boat = Boat.find(params[:id])
end

def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
  	if @user
  		@user.update(user_params)
  		@user.save
  		redirect_to user_path
  	end
end

def delete
end


private
def user_params
	params.require(:user).permit(:username, :password)
end

end
