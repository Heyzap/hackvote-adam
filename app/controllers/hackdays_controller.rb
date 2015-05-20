class HackdaysController < ApplicationController
	
	def create
		@hackday = Hackday.new(hackday_params)
		@hackday.save
		redirect_to @hackday
	end

	def index
		@new_hackday = Hackday.new
		@hackdays = Hackday.all
		@current_hackday = @hackdays.last
		@past_hackdays = @hackdays.first (@hackdays.size - 1)
	end


	def show
		@hackday = Hackday.find(params[:id])
		if @hackday.closed?
			flash[:danger] = "Hackday has already closed"
			redirect_to(root_url)
		end
		@projects = @hackday.projects
	end

	def update
		@hackday = Hackday.find(params[:id])
		@hackday.close
		@hackday.save
		redirect_to @hackday
	end


	private
		def hackday_params
			params.require(:hackday).permit(:id, :title)	
		end


end
