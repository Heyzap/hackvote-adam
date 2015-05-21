require 'test_helper'

class AddProjectTest < ActionDispatch::IntegrationTest

  def setup
  	@may = hackdays(:may)
  	@june = hackdays(:june)	
  end

  test "can add project to a not closed hackday" do
  	get hackday_path(@may)
  	assert_template 'hackdays/show'
  	assert_difference "Project.count", 1 do
  		post projects_path, project: {name: "p1", creators: "p1s", hackday_id: @may.id}
  	end
  	assert_redirected_to hackday_path(@may)
  end

  test "cannot add project to a closed hackday" do
  	get hackday_path(@june)
  	assert_template 'hackdays/show'
  	assert_no_difference "Project.count" do
  		post projects_path, project: {name: "p1", creators: "p1s", hackday_id: @june.id}
  	end
  end

  test "project must have a name and a creators" do
  	
  	get hackday_path(@may)
  	assert_template 'hackdays/show'
  	assert_no_difference "Project.count" do
  		post projects_path, project: {name: "", creators: "", hackday_id: @may.id}
  	end
  end


end
