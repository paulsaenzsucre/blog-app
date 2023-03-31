class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.update(postsCounter: author.posts.size)
  end
end
