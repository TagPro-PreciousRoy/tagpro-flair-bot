require 'test_helper'

class FlairsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = users(:one)
    @user.build_tag_pro_profile
    @user.save
    sign_in :user, @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
