class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def average_rating
    reviews.average(:rating)
  end

  def highest_rating
    reviews.maximum(:rating)
  end
end
