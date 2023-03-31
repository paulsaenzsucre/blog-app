require 'rails_helper'

RSpec.describe Like, type: :model do
  author = User.new(name: 'Paul', photo: 'http://jun.png', bio: 'Carpenter')
  post = Post.new(author: author, title: 'First post', text: 'Lorem Ipsum')

  context 'When testing update_like_counter method' do
    it 'should update the post likesCounter after create a like' do
      Like.create(post: post, author: author)
      expect(post.likesCounter).to eq 1
    end
  end
end
