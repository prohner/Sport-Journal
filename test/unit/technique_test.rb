require 'test_helper'

class TechniqueTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the basics are required" do
    technique = Technique.new
    assert technique.invalid?
    
    technique.description = "ab"
    assert technique.invalid?
    
    technique.description = "punch"
    assert technique.valid?
  end
end
