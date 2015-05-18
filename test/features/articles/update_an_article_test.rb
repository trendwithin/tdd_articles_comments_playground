require "test_helper"

feature "Updating an Article" do
  before do
    @article = articles :one
  end

  scenario "Article to Update Exists" do
    visit articles_path
    page.must_have_content @article.title
    page.must_have_content @article.body
  end

  scenario "Update Article Title and Body" do
    visit articles_path
    find("a[href='/articles/#{@article.id}/edit']").click
    fill_in 'Title', with: 'Changing the Title'
    fill_in 'Body', with: 'Changing the Body'
    click_on 'Update Article'
    page.must_have_content 'Changing the Title'
    page.must_have_content 'Changing the Body'
  end

  scenario "Update an Article with Malformed Data" do
    visit edit_article_path(@article)
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_on 'Update Article'
    page.must_have_content 'Title can\'t be blank'
    page.must_have_content 'Body can\'t be blank'
  end

end
