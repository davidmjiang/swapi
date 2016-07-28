class Review < ActiveRecord::Base
  belongs_to :planet
  validates :rating, :title, :author_name, :body, presence: true
  validates :body, length: {minimum: 20}
  validates :rating, inclusion: {in: (1..5)}
end
