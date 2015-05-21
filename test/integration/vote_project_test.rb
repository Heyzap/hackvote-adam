require 'test_helper'

class VoteProjectTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@may = hackdays(:may)
  	@june = hackdays(:june)	
  	@p2 = projects(:p2)
  end


  test "can vote at most three times" do
  	get hackday_path (@may)
  	assert_equal 0, @p2.votes
  	@p2.vote
  	# assert_redirected_to hackday_path(@may)
  	assert_equal 1, @p2.votes
  	@p2.vote
		patch project_path(@p2)
  	# patch project_path(@p2)
  	assert_equal 3, @p2.votes
  	@p2.votes
  	# patch project_path(@@p2)
  	assert_equal 3, @p2.votes
  end

end
