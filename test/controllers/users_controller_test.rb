require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should update user" do
    patch :update, id: @user, user: { flair_class: @user.flair_class, flair_text: @user.flair_text }
    assert_redirected_to user_path(assigns(:user))
  end
end
