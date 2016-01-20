class JobsController < ApplicationController
	def new
		@boat = Boat.find(params[:boat_id])
		@job = @boat.job.build
	end
	def create
		@boat = Boat.find(params[:boat_id])
		@job = @boat.job.build(job_params)
		@job.user_id = current_user.id
		@job.save
		redirect_to user_path(current_user.id)
	end

	def update
		@boat = Boat.find(params[:boat_id])
		@job = @boat.job.update(job_params)
		redirect_to user_path(@boat.user.id)
	end

	private 
  	def job_params
    	params.require(:job).permit(:name, :start, :end, :cost, :cargo_description)
	end
end
