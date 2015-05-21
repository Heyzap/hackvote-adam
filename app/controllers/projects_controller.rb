class ProjectsController < ApplicationController
	MAX_VOTES = 3

	def create
		@hackday = Hackday.find_by(id: params[:project][:hackday_id].to_i)
		@project = @hackday.projects.build(project_params)
		if @project.save
			flash.now[:success] = "Project created!"
		else
			flash.now[:danger] = "Project failed to create"
		end
		redirect_to @hackday
	end

	def update
		@project = Project.find_by(id: params[:id].to_i) 
		@hackday = @project.hackday
		
		current_votes = cookies[:"current_votes_#{@project.hackday_id}"].to_i
		if (current_votes >= MAX_VOTES)
			flash[:danger] = "No votes lefted"
		else
			flash[:success] = "Vote succeed"
			cookies[:"current_votes_#{@project.hackday_id}"] = current_votes + 1
			@project.vote
			@project.save
		end
		redirect_to @hackday
	end

	private
		def project_params
			return params.require(:project).permit(:name, :creators)
			
		end
end
