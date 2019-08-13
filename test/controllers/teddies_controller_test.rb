require 'test_helper'

class TeddiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teddies_index_url
    assert_response :success
  end

end
