require 'test_helper'

class WorkoutSessionTest < ActiveSupport::TestCase
  test "work out session attributes must not be empty" do
    workout = WorkoutSession.new
    assert workout.invalid?
    assert workout.errors[:description].any?
    assert workout.errors[:user_id].any?
    assert workout.errors[:workout_date].any?
  end

  test "should have a description" do
    workout = workout_sessions(:no_description)
    assert workout.invalid?

    workout.description = "worked out"
    assert workout.valid?
  end

  test "should belong to a person" do
    workout  = WorkoutSession.new(  :description  => "great times",
                                    :workout_date => "6/2/2011")
    assert workout.invalid?
    
    workout.user = User.first
    assert workout.valid?
  end
end

