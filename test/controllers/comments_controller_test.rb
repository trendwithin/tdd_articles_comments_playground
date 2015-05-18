require "test_helper"

class CommentsControllerTest < ActionController::TestCase
  def setup
    @article = articles(:one)
    @comment = comments(:one)

    @commentary = {
      commenter: 'spl@ering.us',
      body: 'we are the world'
    }
  end

  test 'should get index' do
    get :index, :article_id => @comment.article_id
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test 'should create a comment' do
    assert_difference('Comment.count') do
      post :create, comment: @commentary, article_id: @article.id
    end

    assert_redirected_to article_path(assigns(:article))
    # assert_equal 'Comment was successfully created.', flash[:notice]
  end
end
