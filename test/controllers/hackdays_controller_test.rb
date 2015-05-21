require 'test_helper'

class HackdaysControllerTest < ActionController::TestCase

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
    get :show, id: @june
    assert_response :success
  end

  test "should redirect to root if hacday alread closed" do
    patch :update, id: @june, hackday: {title: "asdf", closed: false}
    assert_not flash.empty?
    assert_redirected_to @june
  end




end
