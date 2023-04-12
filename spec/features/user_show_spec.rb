require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tanjiro Kamado', photo: 'https://static.zerochan.net/Kamado.Tanjirou.full.2705519.jpg',
                        bio: 'Friendly guy that leaves as a demon slayer.')
    @post = Post.create(author: @user, title: 'My first post', text: 'no view')
    @post2 = Post.create(author: @user, title: 'My second post',
                         text: 'This battle was agains my own sister that was converted to demon')
    @post3 = Post.create(author: @user, title: 'My third post',
                         text: 'This battle was agains my own sister that was converted to demon')
    @post4 = Post.create(author: @user, title: 'My third post',
                         text: 'This battle was agains my own sister that was converted to demon')
    @comment = Comment.create(author: @user, post: @post, text: 'Lorem ipsum')

    visit user_path(@user)
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

  it 'shows the bio' do
    expect(page).to have_content(@user.bio)
  end

  it 'shows the first 3 posts' do
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post3.text)
    expect(page).to have_content(@post4.text)
    expect(page).to_not have_content(@post.text)
  end

  it 'shows the all posts button' do
    expect(page).to have_content('See all post')
  end

  it 'redirects me to all posts' do
    link = find('button', text: 'See all post')
    link.click
    expect(page).to have_current_path(user_posts_path(@user.id))
  end
end
