require 'rails_helper'

RSpec.describe Post, type: :model do
  author = User.new(name: 'Paul', photo: 'http://jun.png', bio: 'Carpenter')
  author.save
  subject{ Post.new(author: author, title: 'First post', text: 'Lorem Ipsum')}
  
  before {subject.save}

  context 'When validating title attribute' do
    it 'should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should not be empty' do
      subject.title = ''
      expect(subject).to_not be_valid
    end

    it 'should not not exceed 250 characters.' do
      subject.title = 'X' * 251
      expect(subject).to_not be_valid
    end
  end

  context 'When validating commentsCounter attribute' do
    it 'should be greater than or equal to zero' do
      subject.commentsCounter = -1
      expect(subject).to_not be_valid
      subject.commentsCounter = 0
      expect(subject).to be_valid
      subject.commentsCounter = 50
      expect(subject).to be_valid
    end
  end

  context 'When validating likesCounter attribute' do
    it 'should be greater than or equal to zero' do
      subject.likesCounter = -1
      expect(subject).to_not be_valid
      subject.likesCounter = 0
      expect(subject).to be_valid
      subject.likesCounter = 50
      expect(subject).to be_valid
    end
  end

  context 'When testing recent_comments method' do
    it 'should return the last five comments' do
      first_comment = Comment.create(post: subject, author: author, text: 'Sed auctor.')
      second_comment = Comment.create(post: subject, author: author, text: 'Suspendisse at magna elit.' )
      third_comment = Comment.create(post: subject, author: author, text: 'Nam consectetur.')
      fourth_comment = Comment.create(post: subject, author: author, text: 'Maecenas finibus.')
      fifth_comment = Comment.create(post: subject, author: author, text: 'Maecenas finibus.')
      sixth_comment = Comment.create(post: subject, author: author, text: 'Maecenas finibus.')
      last_comments = [sixth_comment, fifth_comment, fourth_comment, third_comment, second_comment]
      expect(subject.recent_comments).to eq last_comments
    end
  end

  context 'When testing update_post_counter method' do
    it 'should update the author.postCounter after create a comment' do
      Comment.create(post: subject, author: author, text: 'Sed auctor.')
      expect(author.postsCounter).to eq 1
    end
  end
end
