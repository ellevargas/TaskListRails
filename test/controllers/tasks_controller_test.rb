require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  test "Make sure a user can see their tasks" do
    session[:user_id] = users(:weili).id
    get :show, id: tasks(:weilis_tasks).id

    assert_response :success
  end

  test "Make sure a user can see only their tasks" do
    session[:user_id] = users(:ellen).id
    get :show, id: tasks(:ellens_tasks).id

    assert_response :redirect
    assert_equal flash[:notice], "You do not have access to that task"
  end

  # do a model migration so our tasks belong to users
  # and that our users have many tasks
  # modify tasklist app to allow people to log in and keep track of their own tasks so that each user has their own list of tasks
  # practice writing a couple of basic tests (don't go in-depth) and getting oauth working and getting models related

end
