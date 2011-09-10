require 'test_helper'

class TechniqueRepetitionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should have the basics assigned" do
    rep  = technique_repetitions(:one)
    assert rep.valid?
    
    rep.repetitions = nil
    assert rep.invalid?
    rep.repetitions = 0
    assert rep.invalid?
    rep.repetitions = 1
    assert rep.valid?
    
    rep.technique_id = nil
    assert rep.invalid?
    rep.technique_id = 1
    assert rep.valid?
    
    rep.user_id = nil
    assert rep.invalid?
    rep.user_id = 1
    assert rep.valid?

    rep.workout_session_id = nil
    assert rep.invalid?
    rep.workout_session_id = 1
    assert rep.valid?
  end

  test "should belong to a person" do
    rep  = technique_repetitions(:user_less)
    assert rep.invalid?
    
    rep.user = User.first
    assert rep.valid?
  end
end
