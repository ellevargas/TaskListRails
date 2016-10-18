require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  test "Make sure a user can see their tasks" do
    session[:user_id] = users(:weili).id
    get :show, id: tasks(:weilis_tasks).id

    assert_response :success
  end

end
