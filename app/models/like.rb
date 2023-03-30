class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  def self.update_like_counter(post)
    post.update(likesCounter: post.likes.size)
  end
end
