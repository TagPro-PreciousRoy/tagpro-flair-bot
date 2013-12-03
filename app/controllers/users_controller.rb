class UsersController < ApplicationController
  before_action :set_user, only: :update
  respond_to :html, :json

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      flash[:notice] = 'User was successfully updated.' if is_navigational_format?
    end
    respond_with(@user, location: root_url)
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:flair_class, :flair_text)
  end
end
