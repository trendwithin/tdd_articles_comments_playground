require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  def article
    @article ||= Article.new(title: 'Something Wicked This Way',
                 body: 'Upon the eastern horizon a tumbleweed tumbled')
  end

  def test_valid
    assert article.valid?
  end

  def test_validity_without_title
    article.title = '     '
    assert_not article.valid?
  end

  def test_validity_without_body
    article.body = '     '
    assert_not article.valid?
  end

  def test_length_of_title
    article.title = "a" * 255
    assert article.valid?
  end

  def test_length_of_title_doesnt_exceed_255
    article.title = "a" * 256
    assert_not article.valid?
  end

  def test_length_of_article_doesnt_exceed_100000
    article.body = "a" * 100_001
    assert_not article.valid?
  end

end
