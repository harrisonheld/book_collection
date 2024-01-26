# spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'book[title]', with: 'harry potter'
    fill_in 'book[author]', with: 'J.K. Rowling'
    fill_in 'book[price]', with: '19.99'
    fill_in 'book[published_date]', with: '2001-06-26'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'rainy-day scenario: blank author' do
    visit new_book_path
    fill_in 'book[author]', with: '' # blank author
    click_on 'Create Book'
    expect(page).to have_content("Author can't be blank")
  end

  scenario 'rainy-day scenario: invalid price' do
    visit new_book_path
    fill_in 'book[price]', with: 'abc' # invalid price
    click_on 'Create Book'
    expect(page).to have_content("Price is not a number")
  end
  
  scenario 'rainy-day scenario: blank published date' do
    visit new_book_path
    fill_in 'book[published_date]', with: '' # blank published date
    click_on 'Create Book'
    expect(page).to have_content("Published date can't be blank")
  end
end