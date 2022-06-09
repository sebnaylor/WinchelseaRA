require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do 
    sign_in users(:bob)
  end
  
  test "visiting the posts#index" do
    visit posts_url
    assert_selector "h2", text: "Posts"
  end

  test "can add a new post" do 
    visit posts_url
    click_on "view_post"
    # sleep(2)
    # save_and_open_screenshot
  end

  test "can vote and comment on a post" do
    visit post_url(Post.first)
    click_on "+1"
    find_field('comment[text]', with: '').set('new value to set')
    sleep(1)
    save_and_open_screenshot
    click_on "Create Comment"
    # save_and_open_screenshot
  end
end
