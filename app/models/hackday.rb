class Hackday < ActiveRecord::Base
	has_many :projects
	validates :title, presence: :true
	validates :closed, presence: :true

	def close
		self.closed = true
	end


end
