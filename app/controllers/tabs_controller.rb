# typed: true
# frozen_string_literal: true

class TabsController < ApplicationController
  before_action :authenticate
  before_action :only_staff

  before_action :set_tab, only: [:show, :edit, :update, :destroy]

  def index
    @tabs = Tab.all.group_by(&:artist).sort
  end

  def show; end

  def new
    @tab = Tab.new
  end

  def edit; end

  def create
    @tab = Tab.new(tab_params)

    if @tab.save
      redirect_to tab_url(@tab), notice: "Tab was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @tab.update(tab_params)
      redirect_to tab_url(@tab), notice: "Tab was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tab.destroy

    redirect_to tabs_url, notice: "Tab was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tab
    @tab = Tab.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tab_params
    tabs_params = T.cast(params.require(:tab), ActionController::Parameters)
    tabs_params.permit(:artist, :album, :song, :tab)
  end

  def only_staff
    raise ActionController::RoutingError, "Not Found" unless Current.user.staff || Current.user.admin
  end
end
