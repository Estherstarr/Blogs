require 'rails_helper'
RSpec.describe 'User show page', type: :system do
  describe 'show page' do
    let!(:author) { User.create(name: 'Joe', photo: 'https://unsplash.com/photos/0J8thHZfosE', bio: 'School Teacher') }
    it 'display user profile picture' do
      visit user_path(author.id)
      image = page.find('img')
      expect(image[:src]).to eq('https://unsplash.com/photos/0J8thHZfosE')
    end
    it 'display user profile picture' do
      visit user_path(author.id)
      expect(page).to have_content('Joe')
    end
    it 'Number of post' do
      visit user_path(author.id)
      expect(page).to have_content('Number of posts: 0')
    end
    it 'display user bio' do
      visit user_path(author.id)
      expect(page).to have_content('School Teacher')
    end
    describe 'Display user first three posts' do
      let!(:post1) do
        Post.create(
          author: author,
          title: 'Lagos to my blog',
          text: 'A method is a rubyhvvcka',
          created_at: 1.days.ago
        )
      end
      let!(:post2) { Post.create(author: author, title: 'Accra', text: 'ytg vvghh') }
      let!(:post3) { Post.create(author: author, title: 'Welcome to my blog', text: 'A method is a rubyhvvcka') }
      let!(:post4) { Post.create(author: author, title: 'Koforidua', text: 'ytg vvghh') }
      it 'show user first 3 posts' do
        visit user_path(author.id)
        expect(page).not_to have_content(post1.title)
        expect(page).to have_content(post2.title)
        expect(page).to have_content(post3.title)
        expect(page).to have_content(post4.title)
      end
    end
    it 'view all user post button' do
      visit user_path(author.id)
      button = page.find('button')
      expect(button).to have_content('See all posts')
    end
    describe 'redirect user' do
      let!(:post1) { Post.create(author: author, title: 'Welcome to my blog', text: 'A method is a rubyhvvcka') }
      let!(:post2) { Post.create(author: author, title: 'Koforidua', text: 'ytg vvghh') }
      it 'when user post is clicked redirect to post show page' do
        visit user_path(author.id)
        click_link post1.title
        expect(page).to have_content('Welcome to my blog')
        expect(page).to have_content('A method is a rubyhvvcka')
      end
      it 'when button see all posts is clicked , redirect to post index page' do
        visit user_path(author.id)
        click_button 'See all posts'
        expect(page).to have_content('Welcome to my blog')
      end
    end
  end
end