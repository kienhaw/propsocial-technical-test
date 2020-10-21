require 'test_helper'

class AdsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get ads_create_url
    assert_response :success
  end

end
