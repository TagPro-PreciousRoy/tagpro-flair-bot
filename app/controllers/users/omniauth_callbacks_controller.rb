class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_oauth
  before_action :find_or_create_user

  def reddit
    if @user
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: @oauth.provider.humanize) if is_navigational_format?
    else
      session["devise.#{request.env['omniauth.auth'].provider}_data"] = @oauth
      head :unauthorized
    end
  end

private

  def set_oauth
    @oauth = request.env['omniauth.auth']
  end

  def find_or_create_user
    @user = User.find_or_create_for_oauth(@oauth)
  end
end
