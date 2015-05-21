require 'test_helper'

class CloseVoteTest < ActionDispatch::IntegrationTest
  
  def setup
    @may = hackdays(:may)
    @june = hackdays(:june) 
  end

  test "can closed open hackday" do
    
    patch hackday_path(@may)
    assert @may.reload.closed   

  end

  test "cannot close closed hackday" do
    patch hackday_path(@june)
    assert_redirected_to @june
  end

end
