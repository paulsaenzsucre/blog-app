class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  after_save :update_comment_counter

  private

  def update_comment_counter
    post.update(commentsCounter: post.comments.size)
  end
end
