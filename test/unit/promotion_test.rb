require 'test_helper'

class PromotionTest < ActiveSupport::TestCase
  test "should belong to a style" do
    rank_black  = promotions(:black)

    assert rank_black.valid?
  end

  test "the truth" do
    assert true
  end
end
