class HackdaysController < ApplicationController
	
	
	def create
		@hackday = Hackday.new(hackday_params)
		redirect_to @hackday
	end

	def index
		@hackdays = Hackday.all	
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
			params.require(:hackday).permit(:title)	
		end


end
