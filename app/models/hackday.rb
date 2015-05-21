class Hackday < ActiveRecord::Base
  has_many :projects
  validates :title, presence: :true, length: {maximum: 80}

  def close
    self.closed = true
  end


end
