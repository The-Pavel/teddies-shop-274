require 'test_helper'

class WewebsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wewebs_index_url
    assert_response :success
  end

end
