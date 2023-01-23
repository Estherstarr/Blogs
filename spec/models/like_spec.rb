require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:author) { User.create(name: 'Onome') }
  let(:post) { Post.create(author: author, title: 'This is my first blog', text: 'Welcome to home') }

  describe 'update like counter' do
    before { Like.create(post: post, author: author) }

    it 'increments the comment counter of the post' do
      expect(post.reload.likes_counter).to eq(1)
    end
  end
end
