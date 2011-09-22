require 'test_helper'

class WorkoutSessionsControllerTest < ActionController::TestCase
  test "should create a new workout session" do
    workout_session_description = "workout whatever"
    user = users(:two)
    workout = {
      :description    => workout_session_description,
      :workout_date   => "8/1/2011"
    }

    #post :create, :workout_session => workout
    #assert_redirected_to user
    #assert_not_nil WorkoutSession.find_by_description(workout_session_description)
  end

end
