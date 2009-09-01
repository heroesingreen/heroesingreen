require 'test_helper'

class PlantTemplatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plant_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plant_template" do
    assert_difference('PlantTemplate.count') do
      post :create, :plant_template => { }
    end

    assert_redirected_to plant_template_path(assigns(:plant_template))
  end

  test "should show plant_template" do
    get :show, :id => plant_templates(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => plant_templates(:one).to_param
    assert_response :success
  end

  test "should update plant_template" do
    put :update, :id => plant_templates(:one).to_param, :plant_template => { }
    assert_redirected_to plant_template_path(assigns(:plant_template))
  end

  test "should destroy plant_template" do
    assert_difference('PlantTemplate.count', -1) do
      delete :destroy, :id => plant_templates(:one).to_param
    end

    assert_redirected_to plant_templates_path
  end
end
