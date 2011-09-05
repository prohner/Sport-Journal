require 'test_helper'

class StyleTest < ActiveSupport::TestCase

  test "style has got to have some description...please!" do
    style = Style.new
    assert style.invalid?
    
    style.name = "Judo"
    assert style.valid?
  end
end
