require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase  
  include Devise::TestHelpers
  
  setup do
    @activity = activities(:a1)
    @user = users(:mat)
    sign_in @user      
    @project = projects(:p1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post :create, :activity => { :hours_worked => 6, :date => Date.parse('2010-07-01'), :description => 'test' , :project => @project }
    end
  
    assert_redirected_to activity_path(assigns(:activity))
  end
    
  test "should show activity" do
    get :show, :id => @activity.to_param
    assert_response :success
  end
      
  test "should get edit" do
    get :edit, :id => @activity.to_param
    assert_response :success
  end
      
  test "should update activity" do
    put :update, :id => @activity.to_param, :activity => @activity.attributes
    assert_redirected_to activity_path(assigns(:activity))
  end
  
  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete :destroy, :id => @activity.to_param
    end
  
    assert_redirected_to activities_path
  end                      
end
