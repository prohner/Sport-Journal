require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user attributes must not be empty" do
    #  email      :string(255)
    #  firstname  :string(255)
    #  lastname   :string(255)
    user = User.new
    assert user.invalid?
    assert user.errors[:email].any?
    assert user.errors[:firstname].any?
    assert user.errors[:lastname].any?
  end
  
  test "user fixtures should be valid" do
    user = users(:one)
    assert user.valid?, user.errors

    user = users(:two)
    assert user.valid?, user.errors
  end
  
  test "should accept valid email addresses" do
    user = users(:one)
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      user.email = address
      assert user.valid?, user.errors
    end
  end

  test "should not accept valid email addresses" do
    user = users(:one)
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      user.email = address
      assert !user.valid?, user.errors
    end
  end
  
  test "should have workout sessions" do
    user = users(:one)
    workout = workout_sessions(:one)
    user.workout_sessions << workout
    assert user.workout_sessions.count == 1
    assert user.save!
  end
  
  test "should have workout sessions descending by date" do
    user            = users(:one)
    workout_recent  = workout_sessions(:recent)
    workout_old     = workout_sessions(:old)
    user.workout_sessions << workout_recent
    user.workout_sessions << workout_old
    assert user.workout_sessions.count == 2
    assert user.save!
    
    assert user.workout_sessions == [workout_recent, workout_old]
  end
  
  test "should have promotions descending by date" do
    user        = users(:one)
    rank_black  = promotions(:black)
    rank_red    = promotions(:red)
    user.promotions << rank_black
    user.promotions << rank_red
    assert user.promotions.count == 2
    assert user.save!
    
    assert user.promotions == [rank_black, rank_red]
  end
  
  test "should have promotions" do
    user = users(:one)
    rank_black  = promotions(:black)
    user.promotions << rank_black
    assert user.promotions.count == 1
    assert user.save!
  end
end
