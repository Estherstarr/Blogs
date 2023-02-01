require 'rails_helper'

RSpec.describe 'User index page', type: :system do
  describe 'index page' do
    let!(:author) { User.create(name: 'Joe', photo: 'https://unsplash.com/photos/0J8thHZfosE') }

    it 'display names of all users' do
      visit users_path
      expect(page).to have_content('Joe')
    end

    it 'display profile picture' do
      visit users_path
      image = page.find('img')
      expect(image[:src]).to eq('https://unsplash.com/photos/0J8thHZfosE')
    end

    it 'show default post number' do
      visit users_path
      expect(page).to have_content('Number of posts: 0')
    end

    describe 'count posts' do
      before do
        Post.create(author: author, title: 'Welcome to my blog', text: 'A method is a rubyhvvcka')
      end

      it 'show number of post after a post is added' do
        visit users_path
        expect(page).to have_content('Number of posts: 1')
      end
    end

    describe 'redirect to user show page' do
      it 'show user page' do
        visit users_path
        click_link 'user_photo'
        expect(page).to have_content('Joe')
        expect(page).to have_content('See all posts')
      end
    end
  end
end
