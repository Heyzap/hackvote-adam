class Project < ActiveRecord::Base
  belongs_to :hackday

  validates :creators, presence: :true
  validates :name, presence: :true
  validate :hackday_is_open


  def vote
    self.votes += 1 
  end

  def hackday_is_open
    if self.hackday.closed?
      errors.add(:base, "hackday must be open")
    else
      return true
    end
  end

end
