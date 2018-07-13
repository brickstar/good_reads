require 'rails_helper'

describe 'visits a book show page' do
  before(:each) do
    @book = Book.create!(title: 'Little Blue Truck')
    @user_1 = @book.users.create!(name: 'Pearl')
    @user_2 = @book.users.create!(name: 'Heidi')
    @review_1 = @book.reviews.create!(body: 'loved it', rating: 5, user_id: @user_1.id)
    @review_2 = @book.reviews.create!(body: 'hated it', rating: 1, user_id: @user_2.id)
  end

  it 'should see book title, list of reviews,
    review body, name of reviewer' do

    visit book_path(@book)

    expect(page).to have_content(@book.title)
    expect(page).to have_content(@user_1.name)
    expect(page).to have_content(@review_1.body)
    expect(page).to have_content(@user_2.name)
    expect(page).to have_content(@review_2.body)
  end
end