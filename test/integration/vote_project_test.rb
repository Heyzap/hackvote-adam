require 'test_helper'

class VoteProjectTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@may = hackdays(:may)
  	@june = hackdays(:june)	
  	@p1 = projects(:p1)
  	@p2 = projects(:p2)
  end

  test "can vote on open hackdays" do
  	get hackday_path(@may)
  	assert_template 'hackdays/show'
  	assert_difference '@p2.reload.votes', 1 do
  		patch project_path(@p2)
  	end
  	assert_redirected_to(@may)
  	follow_redirect!
  	assert_template 'hackdays/show'
  end
  test "cannot vote on closed hackdays" do
  	assert_no_difference "@p1.reload.votes" do
  		patch project_path(@p1)
  	end
  	assert_redirected_to @june
  	follow_redirect!
  	assert_template 'hackdays/show'
  end


  test "can vote at most three times" do
  	get hackday_path (@may)
  	assert_equal 0, @p2.votes
  	patch project_path(@p2)
  	assert_redirected_to hackday_path(@may)
  	assert_equal 1, @p2.reload.votes
		patch project_path(@p2)
  	patch project_path(@p2)
  	assert_equal 3, @p2.reload.votes
  	patch project_path(@p2)
  	assert_equal 3, @p2.reload.votes
  end

end
