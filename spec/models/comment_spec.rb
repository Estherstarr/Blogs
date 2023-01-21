require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:author) { User.create(name: 'Onome') }
  let(:post) { Post.create(author: author, title: 'This is my first blog', text: 'Welcome to home') }

  describe 'update comment counter' do
    before { Comment.create(post: post, author: author, text: 'Nice blog') }

    it 'increments the comment counter of the post' do
      expect(post.reload.comments_counter).to eq(1)
    end
  end
end
