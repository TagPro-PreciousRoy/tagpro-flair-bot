class TagProProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_tag_pro_profile, only: [:show, :edit, :update, :destroy, :verify]

  respond_to :html, :json

  # GET /tag_pro_profile
  # GET /tag_pro_profile.json
  def show
    respond_with(@tag_pro_profile, location: tag_pro_profile_url)
  end

  # GET /tag_pro_profile/new
  def new
    @tag_pro_profile = current_user.build_tag_pro_profile
    respond_with(@tag_pro_profile, location: tag_pro_profile_url)
  end

  # GET /tag_pro_profile/edit
  def edit
    respond_with(@tag_pro_profile, location: tag_pro_profile_url)
  end

  # POST /tag_pro_profile
  # POST /tag_pro_profile.json
  def create
    @tag_pro_profile = current_user.build_tag_pro_profile(tag_pro_profile_params)
    if @tag_pro_profile.save
      flash[:notice] = 'Tag pro profile was successfully created.' if is_navigational_format?
    end
    respond_with(@tag_pro_profile, location: root_url)
  end

  # PATCH/PUT /tag_pro_profile
  # PATCH/PUT /tag_pro_profile.json
  def update
    if @tag_pro_profile.update(tag_pro_profile_params)
      flash[:notice] = 'Tag pro profile was successfully updated.' if is_navigational_format?
    end
    respond_with(@tag_pro_profile, location: root_url)
  end

  # DELETE /tag_pro_profile
  # DELETE /tag_pro_profile.json
  def destroy
    @tag_pro_profile.destroy
    respond_with(@tag_pro_profile, location: root_url)
  end

  def verify
    @tag_pro_profile.verify!
    respond_with(@tag_pro_profile, location: root_url)
  end

private

  def set_tag_pro_profile
    @tag_pro_profile = current_user.tag_pro_profile or raise ActiveRecord::RecordNotFound
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_pro_profile_params
    params.require(:tag_pro_profile).permit(:url)
  end
end
