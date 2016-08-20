class PlanetsController < ApplicationController

  def index
    @planets = Planet.all
    @sorted = false
    if params[:sort_by]
      @sorted = true
      @planets = sorted_list(@planets, params[:sort_by])
    end
  end

  def show
    @planet = Planet.find(params[:id])
    @review = Review.new
    @review.planet_id = @planet.id
  end

  private

  def sorted_list(planets, sort_by)
    case sort_by
    when "top_rated"
      planets.order(average_rating: :desc)
    when "deserts"
      planets.select{|p| p.terrain.split(", ").include?("desert")}
    when 'forests'
      planets.select{|p| p.terrain.split(", ").include?("forests")}
    when 'mountains'
      planets.select{|p| p.terrain.split(", ").include?("mountains")}
    end
  end

end
