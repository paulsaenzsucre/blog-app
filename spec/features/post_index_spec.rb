require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tanjiro Kamado', photo: 'https://static.zerochan.net/Kamado.Tanjirou.full.2705519.jpg',
                        bio: 'Friendly guy that leaves as a demon slayer.')
    @post = Post.create(author: @user, title: 'My first post',
                        text: 'This battle was agains my own sister that was converted to demon1')
    @post2 = Post.create(author: @user, title: 'My second post',
                         text: 'This battle was agains my own sister that was converted to demon2')
    @post3 = Post.create(author: @user, title: 'My third post',
                         text: 'This battle was agains my own sister that was converted to demon3')
    @comment = Comment.create(author: @user, post: @post, text: 'Lorem ipsum')
    @comment2 = Comment.create(author: @user, post: @post, text: 'Lorem ipsum2')
    @comment3 = Comment.create(author: @user, post: @post, text: 'Lorem ipsum3')
    @like = Like.create(author: @user, post: @post)
    @like2 = Like.create(author: @user, post: @post)
    visit user_posts_path(@user.id)
  end

  it 'Shows the profile picture' do
    expect(page).to have_selector("img[src*='#{@user.photo}']")
  end

  it 'Shows the username' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the number of posts each user has written' do
    expect(page).to have_content("Number of post: #{@user.postsCounter}")
  end

  it 'Shows the titles' do
    expect(page).to have_content("Post ##{@post.id}")
    expect(page).to have_content("Post ##{@post2.id}")
    expect(page).to have_content("Post ##{@post3.id}")
  end

  it 'Shows the content' do
    expect(page).to have_content(@post.text)
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post3.text)
  end

  it 'Shows the comments' do
    expect(page).to have_content(@comment.text)
    expect(page).to have_content(@comment2.text)
    expect(page).to have_content(@comment3.text)
  end

  it 'shows the number of comments on each post' do
    expect(page).to have_content("Comments: #{@post.commentsCounter}")
  end

  it 'shows the number of likes on each post' do
    expect(page).to have_content("Likes: #{@post.likesCounter}")
  end

  it 'shows a button for pagination' do
    expect(page).to have_content('Pagination')
  end

  it 'redirects me to a specif post' do
    link = find("a[href='#{user_post_path(@user, @post)}']")
    link.click
    expect(page).to have_current_path(user_post_path(@user, @post))
  end
end
