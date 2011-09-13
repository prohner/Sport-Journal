require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @input_attributes = {
      :firstname    => "Sam",
      :lastname     => "Rohner",
      :email        => "sam@yahoo.com"
    }
  end

  test "should get show" do
    get :show, :id => @user.id
    assert_response :success
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => @input_attributes
      assert_redirected_to users_url
    end
  end

  test "should get 'show' and have workout sessions and a tag_cloud " do
    workout_session = workout_sessions(:one)
    the_tag = "forms"
    workout_session.tag_list = the_tag
    @user.workout_sessions << workout_session
    assert @user.save!
    
    get :show, :id => @user.id
    assert_response :success
    
    assert_select '.workout', workout_session.description
    assert_select '.tag_cloud', /forms/
    
  end
  
end
