# typed: true
# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate
  before_action :set_profile, only: [:show, :edit, :update]

  def show; end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to profile_url, notice: "Profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = Current.profile
  end

  def profile_params
    profile_params = T.cast(params.require(:profile), ActionController::Parameters)
    profile_params.permit(:count_in, :mute_exercises)
  end
end
