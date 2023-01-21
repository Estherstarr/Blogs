require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(
      name: 'Onomeh',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico'
    )
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  describe 'post counter validation' do
    context 'when counter is nil' do
      before { subject.posts_counter = nil }
      it 'is not valid' do
        expect(subject).to_not be_valid
      end
    end

    context 'when counter is a negative number' do 
      before { subject.posts_counter = -2 }
      it 'is not valid' do
        expect(subject).to_not be_valid
      end

    end
    
  end
end
