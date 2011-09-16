require 'test_helper'

class WorkoutSessionsControllerTest < ActionController::TestCase
  test "should create a new workout session" do
    #workout_session = workout_sessions(:recent)
    workout = {
      :description    => "a workout and all that",
      :user_id        => 1,
      :workout_date   => "8/1/2011"
    }

    post :create, :workout_session => workout
    assert_redirected_to users_url
  end

end
