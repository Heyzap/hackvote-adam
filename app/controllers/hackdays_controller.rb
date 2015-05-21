class HackdaysController < ApplicationController
  
  def create
    @hackday = Hackday.new(hackday_params)
    if @hackday.save
      flash[:success] = "successfully added a hackday"
      redirect_to @hackday
    else
      flash[:errors] = @hackday.errors.full_messages
      render 'index'
    end

  end

  def index
    @new_hackday = Hackday.new
    @hackdays = Hackday.all
    @current_hackday = @hackdays.last #most recent one  
    @past_hackdays = @hackdays[0...-1]
  end

  def show
    @hackday = Hackday.find_by_id(params[:id].to_i)
    unless @hackday.closed?
      @new_project = Project.new
    end
    @projects = @hackday.projects
  end

  def update
    @hackday = Hackday.find_by_id(params[:id].to_i)
    if @hackday.closed?
      flash[:errors] = "Hackday has already closed"
      redirect_to @hackday
    else
      @hackday.close
      @hackday.save
      redirect_to @hackday  
    end
  end

  private
    def hackday_params
      params.require(:hackday).permit(:title) 
    end


end
