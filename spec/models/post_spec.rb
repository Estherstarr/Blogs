require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.new(name: 'Onomeh') }
  subject do
    Post.new(
      title: 'This is my first blog',
      author: author
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  describe 'comment counter validation' do
    context 'when counter is nil' do
      before { subject.comments_counter = nil }
      it 'is not valid' do
        expect(subject).to_not be_valid
      end
    end

    context 'when counter is a negative number' do
      before { subject.likes_counter = -2 }
      it 'is not valid' do
        expect(subject).to_not be_valid
      end
    end
  end
end
