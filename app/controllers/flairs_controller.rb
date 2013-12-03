class FlairsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :json

  def index
    @flairs = current_user.tag_pro_profile.flairs
    respond_with(@flairs)
  end
end
