class ItemsController < ApplicationController
	before_action :login_required, :only => [ :edit, :update, :finished, :checked ]
	before_action :get_project_step_item

	def check
		@item.checked = true;
		@item.save


		done = true
		@item.step.items.each do |i|
			done = false if !i.checked
		end

		respond_to do |format|
			format.html { render :json => { success: true, done: done }, :content_type => 'application/json' }
		end
	end

	def uncheck
		@item.checked = false;
		@item.save

		respond_to do |format|
			format.html { render :json => { success: true, done: false }, :content_type => 'application/json' }
		end
	end

	private

	def get_project_step_item
		@project = current_user.projects.find(params[:project_id])
		@step = @project.steps.find(params[:step_id])
		@item = @step.items.find(params[:id])
	end

end
