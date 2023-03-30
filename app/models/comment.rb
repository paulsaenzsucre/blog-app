class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  def self.update_comment_counter(post)
    post.update(commentsCounter: post.comments.size)
  end
end