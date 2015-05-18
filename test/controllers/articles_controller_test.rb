require "test_helper"

class ArticlesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_post_with_invalid_parameters
    options = {
      title: '',
      body: ''
    }
    post :create, article: options
    must_render_template :new
  end

  def test_post_creating_an_article_with_title_body
    options = {
      title: 'Furious Few',
      body: 'Hullabaloo'
    }

    assert_difference('Article.count') do
      post :create, article: options
    end

    assert_redirected_to article_path(assigns(:article))
    assert_equal 'Article was successfully created.', flash[:notice]
  end

  def test_getting_the_created_article_to_show
    article = articles(:one)

    get :show, id: article.id
    must_respond_with :success
    assigns(:article). must_equal(article)
  end

  def test_destory_an_existing_article
    article = articles(:one)
    assert_difference('Article.count', -1) do
      delete :destroy, id: article.id
    end

    assert_redirected_to articles_path
  end
end
