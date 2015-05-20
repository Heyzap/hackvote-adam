require 'test_helper'

class HackdaysControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@may = hackdays(:may)
  	@june = hackdays(:june)
  end

  test "should get index" do
  	get :index
  	assert_response :success
  end

  test "should get show" do


  	get :show, id: @may
  	assert_response :success
  	debugger
  	get :show, id: @june
  	assert_response :success
  	
  end



end
