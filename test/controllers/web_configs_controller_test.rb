require "test_helper"

class WebConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @web_config = web_configs(:one)
  end

  test "should get index" do
    get web_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_web_config_url
    assert_response :success
  end

  test "should create web_config" do
    assert_difference('WebConfig.count') do
      post web_configs_url, params: { web_config: {  } }
    end

    assert_redirected_to web_config_url(WebConfig.last)
  end

  test "should show web_config" do
    get web_config_url(@web_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_web_config_url(@web_config)
    assert_response :success
  end

  test "should update web_config" do
    patch web_config_url(@web_config), params: { web_config: {  } }
    assert_redirected_to web_config_url(@web_config)
  end

  test "should destroy web_config" do
    assert_difference('WebConfig.count', -1) do
      delete web_config_url(@web_config)
    end

    assert_redirected_to web_configs_url
  end
end
