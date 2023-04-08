class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, comparison: { greater_than_or_equal_to: 0 }
  validates :likesCounter, comparison: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end  

  def previous
    user_posts = self.author.posts.order(id: :desc)
    pointer = user_posts.find_index(self)
    pointer.zero? ? 0 : user_posts[pointer - 1].id
  end

  def next
    user_posts = self.author.posts.order(id: :desc)
    pointer = user_posts.find_index(self)
    pointer == user_posts.length - 1 ? 0 : user_posts[pointer + 1].id
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.update(postsCounter: author.posts.size)
  end
end
