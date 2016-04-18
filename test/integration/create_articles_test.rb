require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "cheng", email: "cheng@example.com", password: "password", admin: true)
  end

  test "get new article and create" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count' do
      post_via_redirect articles_path, article: {title: "test article title", description: "test artricle description by chenyucheng"}
    end
    assert_template 'articles/show'
    assert_match "test article title", response.body
  end
end
