class StarsController < ApplicationController

  def new
    @star = Star.new
  end

  def create
    @star = Star.new(star_params)
    if @star.save
      redirect_to star_path(@star)
    else
      render :new
    end
  end

  def edit
    set_star
  end

  def update
    set_star
    @star.update(star_params)

    redirect_to star_path(@star)
  end

  private

  def set_star
    @star = Star.find(params[:id])
  end

  def star_params
    params.require(:star).permit(:name, :price)
  end
end
