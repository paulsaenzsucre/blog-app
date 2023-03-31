require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Paul', photo: 'http://jun.png', bio: 'Carpenter') }

  before { subject.save }

  context 'When validating name attribute' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  context 'When validating postsCounter attribute' do
    it 'should be greater than or equal to zero' do
      subject.postsCounter = -1
      expect(subject).to_not be_valid
      subject.postsCounter = 0
      expect(subject).to be_valid
      subject.postsCounter = 50
      expect(subject).to be_valid
    end
  end

  context 'When testing recent_posts method' do
    it 'should return the last three posts' do
      Post.create(author: subject, title: 'First seed post', text: 'Lorem Ipsum is simply dummy text.')
      second_post = Post.create(author: subject, title: 'Second seed post', text: 'Lorem Ipsum is simply dummy text.')
      third_post = Post.create(author: subject, title: 'Third seed post', text: 'Lorem Ipsum is simply dummy text.')
      fourth_post = Post.create(author: subject, title: 'Fourth seed post', text: 'Lorem Ipsum is simply dummy text.')
      last_posts = [fourth_post, third_post, second_post]

      expect(subject.recent_posts).to eq last_posts
    end
  end
end
