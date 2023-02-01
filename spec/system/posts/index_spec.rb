require 'rails_helper'
RSpec.describe 'Post index page', type: :system do
  describe 'index page' do
    let!(:author) { User.create(name: 'Joe', photo: 'https://unsplash.com/photos/0J8thHZfosE') }
    let!(:post) { Post.create(author: author, title: 'Welcome to my blog', text: 'A method is a rubyhvvcka') }
    let!(:comment1) { Comment.create(post: post, author: author, text: 'Good post') }
    it 'display user profile picture' do
      visit user_posts_path(author.id)
      image = page.find('img')
      expect(image[:src]).to eq('https://unsplash.com/photos/0J8thHZfosE')
    end
    it 'display username' do
      visit user_posts_path(author.id)
      expect(page).to have_content('Joe')
    end
    it 'number of posts' do
      visit user_posts_path(author.id)
      expect(page).to have_content('Number of posts: 1')
    end
    it 'display post title' do
      visit user_posts_path(author.id)
      expect(page).to have_content('Welcome to my blog')
    end
    it 'display post body' do
      visit user_posts_path(author.id)
      expect(page).to have_content('A method is a rubyhvvcka')
    end
    it 'display first comment on a post' do
      visit user_posts_path(author.id)
      expect(page).to have_content('Good post')
    end
    it 'display number of comments for a post' do
      visit user_posts_path(author.id)
      expect(page).to have_content('comments: 1')
    end
    it 'display number of likes for a post' do
      visit user_posts_path(author.id)
      expect(page).to have_content('likes: 0')
    end
    it 'redirect to show page' do
      visit user_posts_path(author.id)
      click_link post.title
      expect(page).to have_content('A method is a rubyhvvcka')
    end
  end
end
