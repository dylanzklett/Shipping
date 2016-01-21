class BoatsController < ApplicationController
  def new
    @boat = Boat.new
    @user = current_user
  end

  def create
    @boat = current_user.boats.build(boat_params)
      if @boat.save
        redirect_to user_path(current_user)
      else
        redirect_to user_path(current_user)
        flash[:alert] = "Try again, darkness my old friend."
      end
  end

  def show
  end

  def edit
    @boat = Boat.find(params[:id])
    @user = User.find(@boat.user_id)
    @job = @boat.job
    
  end

  def update
    @boat = Boat.find(params[:id])
    @user = @boat.user_id
    # @job = @boat.job
    # @job.update(job_params)
    # @boat.save
    if @boat.update(boat_params)
      redirect_to user_path(@user)
    else
      redirect_to root_path, flash[:alert] = "Are ye daft? We can't take a job like that!"
    end
  end

  def destroy
    @boat = Boat.find(params[:id])
    if @boat.destroy
    else
      render 'new'
      flash[:alert] = "She's not going to the deep without a fight, apparently."
    end
    redirect_to user_path(current_user)
  end

  private 
  def boat_params
    params.require(:boat).permit(:name, :cargo_cap, :crew, :location, :avatar)
  end

  def job_params
      params.require(:job).permit(:name, :start, :end, :cost, :cargo_description)
  end
end
