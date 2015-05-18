require "test_helper"

feature "Visit New Article Path" do
  scenario "New Article Form" do
    visit new_article_path
    page.must_have_content "New Article"
  end
end

feature "Create New Article" do
  scenario "Fill In Title/Body" do
    visit new_article_path
    fill_in 'Title', with: 'Newest Article'
    fill_in 'Body', with: 'New Body'
    click_on 'Create Article'
    page.must_have_content 'Newest Article'
    page.must_have_content 'New Body'
  end
end

feature "Create New Aritcle" do
  scenario "Empty Title" do
    visit new_article_path
    click_on 'Create Article'
    page.must_have_content 'Title can\'t be blank'
    page.must_have_content 'Body can\'t be blank'
  end
end

