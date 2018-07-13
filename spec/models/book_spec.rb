require 'rails_helper'

describe Book, type: :model do
  describe 'instance methods' do
    before(:each) do
      @book = Book.create!(title: 'Little Blue Truck')
      @user_1 = @book.users.create!(name: 'Pearl')
      @user_2 = @book.users.create!(name: 'Heidi')
      @review_1 = @book.reviews.create!(body: 'loved it', rating: 5, user_id: @user_1.id)
      @review_2 = @book.reviews.create!(body: 'hated it', rating: 1, user_id: @user_2.id)
    end
    describe '.average_rating' do
      it 'should return average rating for the book' do

        expect(@book.average_rating).to eq(3)
      end
    end
  end
end
