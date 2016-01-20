class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_username(params[:username])
		   if @user && @user.authenticate(params[:password])
		   	session[:user_id] = @user.id     
		    redirect_to users_path, :notice => "Welcome back, #{@user.username}."   
		   else
		    flash[:alert] = "Invalid email or password"
		    render "new"
		   end
	end

def destroy
    @user = User.find(params[:id])
    if @user
      session.clear
      redirect_to root_path
    else
      redirect_to user_path
    end
  end
end
