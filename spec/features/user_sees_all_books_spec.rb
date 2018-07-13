require 'rails_helper'


describe 'user visits book index' do
    before(:each) do
      @book1 = Book.create!(title: 'Little Blue Truck')
      @book2 = Book.create!(title: 'Goodnight Moon')
      @user_1 = @book.users.create!(name: 'Pearl')
      @user_2 = @book.users.create!(name: 'Heidi')
      @review_1 = @book1.reviews.create!(body: 'loved it', rating: 5, user_id: @user_1.id)
      @review_2 = @book1.reviews.create!(body: 'hated it', rating: 1, user_id: @user_2.id)
      @review_3 = @book2.reviews.create!(body: 'hated it', rating: 1, user_id: @user_2.id)
      @review_4 = @book2.reviews.create!(body: 'hated it', rating: 1, user_id: @user_2.id)
    end

  it 'should see all book titles as links to their show pages' do

    visit books_path

    expect(page).to have_content(@book.title)
  end
end
