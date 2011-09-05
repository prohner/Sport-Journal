require 'test_helper'

class WorkoutSessionTest < ActiveSupport::TestCase
  test "work out session attributes must not be empty" do
    workout = WorkoutSession.new
    assert workout.invalid?
    assert workout.errors[:description].any?
    assert workout.errors[:user_id].any?
    assert workout.errors[:workout_date].any?
  end
end

