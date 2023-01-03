# typed: true
# frozen_string_literal: true

class TabsController < ApplicationController
  before_action :authenticate

  before_action :set_tab, only: [:show, :edit, :update, :destroy]

  def index
    authorize Tab.new, :index?
    @tabs = Tab.all.group_by(&:artist).sort
  end

  def show
    authorize @tab
  end

  def new
    @tab = Tab.new
    authorize @tab
  end

  def edit
    authorize @tab
  end

  def create
    @tab = Tab.new(tab_params)
    authorize @tab

    if @tab.save
      redirect_to tab_url(@tab), notice: "Tab was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @tab

    if @tab.update(tab_params)
      redirect_to tab_url(@tab), notice: "Tab was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @tab

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
end
