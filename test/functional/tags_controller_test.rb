require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should " do
    user = users(:one)
    forms_workout = "description of the forms workout"

    workout_session = WorkoutSession.create!( :description  => forms_workout,
                                              :workout_date => "6/2/2011",
                                              :user         => user)
    workout_session.tag_list = "forms,self-defense"
    user.workout_sessions << workout_session
    assert user.save!

    get :show, :id => "forms"
    assert_select '.workout', forms_workout
  end
end
