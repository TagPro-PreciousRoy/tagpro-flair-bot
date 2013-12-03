require 'test_helper'

class TagProProfilesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = users(:one)
    sign_in :user, @user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag_pro_profile" do
    assert_difference('TagProProfile.count') do
      post :create, tag_pro_profile: { server: 'server', uid: 'uid' }
    end

    assert_redirected_to tag_pro_profile_path
  end

  test "should show tag_pro_profile" do
    @user.tag_pro_profile = tag_pro_profiles(:one)
    @user.save
    get :show
    assert_response :success
  end

  test "should get edit" do
    @user.tag_pro_profile = tag_pro_profiles(:one)
    @user.save
    get :edit
    assert_response :success
  end

  test "should update tag_pro_profile" do
    @user.tag_pro_profile = tag_pro_profiles(:one)
    @user.save
    patch :update, tag_pro_profile: { server: 'server', uid: 'uid' }
    assert_redirected_to tag_pro_profile_path
  end

  test "should destroy tag_pro_profile" do
    @user.tag_pro_profile = tag_pro_profiles(:one)
    @user.save
    assert_difference('TagProProfile.count', -1) do
      delete :destroy
    end

    assert_redirected_to tag_pro_profile_path
  end
end
