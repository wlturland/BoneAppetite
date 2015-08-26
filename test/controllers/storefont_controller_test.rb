require 'test_helper'

class StorefontControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '.panel', 2
    assert_select 'h4', 'Dog Chow'
  end

end
