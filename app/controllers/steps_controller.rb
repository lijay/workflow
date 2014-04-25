class StepsController < ApplicationController

	before_action :login_required, :only => [ :edit, :update, :finished ]
	before_action :get_project_step

	def edit
		# @project = Project.find(params[:project_id])
		# @step = @project.steps.find(params[:id])
	end

	def update
		# @project = Project.find(params[:project_id])
		# @step = @project.steps.find(params[:id])

		if @step.update(step_params)
			redirect_to projects_path
		else
			render :edit
		end
	end

	def finish
		move_to_this_step(@project, @step)
		redirect_to projects_path
	end

	def content
		respond_to do |format|
			format.html { render :layout => !request.xhr? }
		end
	end

	private

	def get_project_step
		@project = current_user.projects.find(params[:project_id])
		@step = @project.steps.find(params[:id])
	end

	def move_to_this_step(project, step)
		@steps = project.steps
		@steps.each do |s|
			if s.no <= step.no
				s.finished = true
				s.save
			else
				s.finished = false
				s.save
			end
		end
	end

	def step_params
		params.require(:step).permit(:name, :memo)
	end
end
