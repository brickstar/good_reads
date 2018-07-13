class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def average_rating
    reviews.average(:rating)
  end

  def highest_rating
    reviews.maximum(:rating)
  end

  def lowest_rating
    reviews.minimum(:rating)
  end

  def highest_rated_review
    reviews.find_by(rating: highest_rating)
  end

  def lowest_rated_review
    reviews.find_by(rating: lowest_rating)
  end
end
