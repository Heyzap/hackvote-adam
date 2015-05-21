class ProjectsController < ApplicationController

  MAX_VOTES = 3

  def create
    @hackday = Hackday.find_by_id(params[:project][:hackday_id].to_i)
    @project = @hackday.projects.build(project_params)
    if @project.save
      flash.now[:success] = "Project created!"
    else
      flash.now[:errors] = @project.errors.full_messages
    end
    redirect_to @hackday
  end

  def update
    @project = Project.find_by_id(params[:id].to_i) 
    @hackday = @project.hackday

    if @hackday.closed?
      flash[:errros] = "Hackday has already closed"
    else
      current_votes = sessions[:"current_votes_#{@project.hackday_id}"].to_i
      if (current_votes >= MAX_VOTES)
        flash[:errors] = "No votes lefted"
      else
        @project.vote
        if @project.save
          flash[:success] = "Vote succeed"
          sessions[:"current_votes_#{@project.hackday_id}"] = current_votes + 1
        else
          flash[:errors] = @project.errors.full_messages
        end

      end
    end
    redirect_to @hackday
  end

  private
    def project_params
      return params.require(:project).permit(:name, :creators)
    end

end
