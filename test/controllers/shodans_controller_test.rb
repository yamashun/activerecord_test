require 'test_helper'

class ShodansControllerTest < ActionController::TestCase
  setup do
    @shodan = shodans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shodans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shodan" do
    assert_difference('Shodan.count') do
      post :create, shodan: { bb_number: @shodan.bb_number, first_name: @shodan.first_name, last_name: @shodan.last_name, status: @shodan.status }
    end

    assert_redirected_to shodan_path(assigns(:shodan))
  end

  test "should show shodan" do
    get :show, id: @shodan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shodan
    assert_response :success
  end

  test "should update shodan" do
    patch :update, id: @shodan, shodan: { bb_number: @shodan.bb_number, first_name: @shodan.first_name, last_name: @shodan.last_name, status: @shodan.status }
    assert_redirected_to shodan_path(assigns(:shodan))
  end

  test "should destroy shodan" do
    assert_difference('Shodan.count', -1) do
      delete :destroy, id: @shodan
    end

    assert_redirected_to shodans_path
  end
end
