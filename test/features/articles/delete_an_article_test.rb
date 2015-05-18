require "test_helper"

feature "Delete An Article" do
  before do
    @article = articles :one
    @title = @article.title
  end

  scenario "User Deletes an Article" do
    # Capy Ambiguous Error- Research Resolution
  end
end
