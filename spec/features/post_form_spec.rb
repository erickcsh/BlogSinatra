require_relative '../spec_helper'
require 'constants'

feature "Visitor gets to the post form page" do
  scenario "editing a post" do
    post = Blog::DBAdapter.find_post_by_id(Blog::DBAdapter.new_post(A_TITLE, A_BODY))
    visit '/'
    click_button('Edit')
    find(:xpath,'//input[@type="hidden"]')[:value].should == "#{post.id}"
    find('#name')[:value].should == "#{post.title}"
    expect(page).to have_content post.body
    expect(page).to have_content 'Edit'
  end

  scenario "adding a post" do
    visit '/'
    click_button('New')
    find(:xpath,'//input[@type="hidden"]')[:value].should == ""
    find('#name')[:value].should == ""
    expect(page).to have_content 'Content here...'
    expect(page).to have_content 'New'
  end
end
