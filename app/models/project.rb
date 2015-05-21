class Project < ActiveRecord::Base
	belongs_to :hackday

	validates :creators, presence: :true
	validates :name, presence: :true
	


	def vote
		self.votes += 1	
	end

end
