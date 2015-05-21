class Hackday < ActiveRecord::Base
  has_many :projects
  validates :title, presence: :true


  def close
    self.closed = true
  end


end
