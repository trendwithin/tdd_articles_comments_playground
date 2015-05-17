require "test_helper"

feature "Visit New Article Path" do
  scenario "New Article Form" do
    visit new_article_path
    page.must_have_content "New Article"
  end
end
