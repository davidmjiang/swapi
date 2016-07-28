class PlanetsController < ApplicationController

  def index
    @planets = Planet.all
  end

  def show
    @planet = Planet.find(params[:id])
    @review = Review.new
    @review.planet_id = @planet.id
  end

end
