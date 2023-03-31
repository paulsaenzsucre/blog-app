require 'rails_helper'

RSpec.describe Comment, type: :model do
  author = User.new(name: 'Paul', photo: 'http://jun.png', bio: 'Carpenter')
  post = Post.new(author: author, title: 'First post', text: 'Lorem Ipsum')

  context 'When testing update_comment_counter method' do
    it 'should update the post commentsCounter after create a comment' do
      Comment.create(post: post, author: author, text: 'Sed auctor.')
      expect(post.commentsCounter).to eq 1
    end
  end
end
