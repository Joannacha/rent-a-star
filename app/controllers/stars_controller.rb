class StarsController < ApplicationController
  def index
    @stars = Star.all
  end
end
