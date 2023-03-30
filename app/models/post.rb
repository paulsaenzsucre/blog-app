class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def self.update_post_counter(author)
    author.update(postsCounter: author.posts.size)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end