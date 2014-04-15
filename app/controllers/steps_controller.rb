class StepsController < ApplicationController

	before_action :login_required, :only => [ :edit, :update ]
	def edit
		@project = Project.find(params[:project_id])
		@step = @project.steps.find(params[:id])
	end

	def update
		@project = Project.find(params[:project_id])
		@step = @project.steps.find(params[:id])

		if @step.update(step_params)
			redirect_to projects_path
		else
			render :edit
		end
	end

	def step_params
		params.require(:step).permit(:name, :memo)
	end
end
