class ProjectsController < ApplicationController
	before_action :login_required, :only => [:index, :new, :edit, :create, :destroy]
	def index
		@projects = current_user.projects.all
	end

	def new
		@project = Project.new
	end

	def edit
		@project = current_user.projects.find(params[:id])
	end

	def update
		@project = current_user.projects.find(params[:id])
		if @project.update(project_params)
			redirect_to projects_path
		else
			render :edit
		end
	end

	def create
		@project = current_user.projects.build(project_params)
		if @project.save 
			redirect_to projects_path
		else
			render :new
		end
	end

	def destroy
		@project = current_user.projects.find(params[:id])
		@project.destroy
		redirect_to projects_path
	end

	private 

	def project_params
		params.require(:project).permit(:title, :description)
	end
end
