require 'test_helper'

class PromotionTest < ActiveSupport::TestCase
  test "should belong to a style" do
    rank_black  = promotions(:black)
    assert rank_black.invalid?
    
    rank_black.style = styles(:tsd)
    assert rank_black.valid?
  end

  test "should belong to a person" do
    rank_black  = Promotion.new(  :rank  => "black",
                                  :promotion_date => "6/2/2011",
                                  :style => styles(:tsd))
    assert rank_black.invalid?
    
    rank_black.user = User.first
    assert rank_black.valid?
  end
end
