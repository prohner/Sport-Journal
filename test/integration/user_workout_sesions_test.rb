require 'test_helper'

class UserWorkoutSesionsTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "should create a new workout session" do
    workout_session_description = "workout whatever"
    user = users(:one)
    
    workout = {
      :description    => workout_session_description,
      :workout_date   => "8/1/2011"
    }
    get user_path(user)

    post_via_redirect "/workout_sessions", :workout_session => workout
    #post :create, :workout_session => workout
    assert_equal user_path(user), path

    assert_not_nil WorkoutSession.find_by_description(workout_session_description)

    get users_url(user)
    #assert_response :success

  end
end
