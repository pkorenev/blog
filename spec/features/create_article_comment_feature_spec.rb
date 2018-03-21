require 'rails_helper'


describe "comments", type: :feature, js: true do
  scenario "add blank comment to article should not be created" do
    visit("http://localhost:3000/articles/1")
    old_comments_count = page.all(:css, ".comment").count
    within("#new-comment-form") do
      fill_in "Comment text", with: ""
    end
    click_button "Submit"
    wait_for_ajax
    #reload_page
    new_comments_count = page.all(:css, ".comment").count
    #expect(page).to have_css
    expect(new_comments_count).to eq(old_comments_count)

  end

  # scenario "add comment to article" do
  #   visit("http://localhost:3000/articles/1")
  #   within("#new-comment-form") do
  #     fill_in "Comment text", with: FFaker::Lorem.phrases
  #   end
  #   click_button "Submit"
  #   expect(page).to have_content(:success)
  # end
  #
  scenario "add comment to article" do
    visit("http://localhost:3000/articles/1")
    old_comments_count = page.all(:css, ".comment").count
    within("#new-comment-form") do
      fill_in "Comment text", with: FFaker::Lorem.phrases.join("")
    end
    click_button "Submit"
    wait_for_ajax
    #reload_page
    new_comments_count = page.all(:css, ".comment").count
    #expect(page).to have_css
    expect(new_comments_count).to eq(old_comments_count + 1)
  end
end