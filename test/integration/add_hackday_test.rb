require 'test_helper'

class AddHackdayTest < ActionDispatch::IntegrationTest

  test "hackday needs a title" do
  	@new = Hackday.new(title: "")
  	@new.save
  	assert_not(@new.valid?)
  end


  test "add hackday" do
  	get root_url
  	assert_template 'hackdays/index'
  	assert_difference 'Hackday.count', 1 do
  		post hackdays_path, hackday: {
  												title: "test1"	
  												}
  	end
  	@new = Hackday.all.last
  	assert_redirected_to hackday_path(@new)

  end

end
