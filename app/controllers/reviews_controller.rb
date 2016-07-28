class ReviewsController < ApplicationController

  def new
    @planet = Planet.find(params[:planet_id])
    @review = Review.new
    @review.planet_id = @planet.id
  end

  def create
    @review = Review.new(review_params)
    @review.planet_id = params[:planet_id]
    @review.rating = params[:rating]

    if @review.save
      redirect_to planet_path(@review.planet)
    else
      @planet = Planet.find(params[:planet_id])
      render :new
   end
  end

  def review_params
    params.require(:review).permit(:author_name, :body, :rating, :title)
  end

end
