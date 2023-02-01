require 'rails_helper'
RSpec.describe 'Post show page', type: :system do
  describe 'show page' do
    let!(:author) { User.create(name: 'Joe', photo: 'https://unsplash.com/photos/0J8thHZfosE') }
    let!(:post) { Post.create(author: author, title: 'Welcome to my blog', text: 'A method is a rubyhvvcka') }
    let!(:comment1) { Comment.create(post: post, author: author, text: 'Good post') }
    it 'display post title' do
      visit user_post_path(author.id, post.id)
      expect(page).to have_content('Welcome to my blog')
    end
    it 'display post author' do
      visit user_post_path(author.id, post.id)
      expect(page).to have_content('Joe')
    end
    it 'display comment counter' do
      visit user_post_path(author.id, post.id)
      expect(page).to have_content('comments: 1')
    end
    it 'display likes counter' do
      visit user_post_path(author.id, post.id)
      expect(page).to have_content('likes: 0')
    end
    it 'display post body' do
      visit user_post_path(author.id, post.id)
      expect(page).to have_content('A method is a rubyhvvcka')
    end
    it 'display comment' do
      visit user_post_path(author.id, post.id)
      expect(page).to have_content('Good post')
    end
  end
end
