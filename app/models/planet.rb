class Planet < ActiveRecord::Base
  has_many :reviews
  
  def average_rating
    ratings = self.reviews.map{|r| r["rating"]}
    average = (ratings.reduce(:+)/ratings.size.to_f).round(1)
  end

end
