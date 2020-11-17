class StarsController < ApplicationController
  before_action :set_star, only: [:show, :update, :destroy]

  def show
  end

  def destroy
    @star = Star.find(params[:id])
    @star.destroy
  end

  private

  def set_star
    @star = Star.find(params[:id])
  end
end
