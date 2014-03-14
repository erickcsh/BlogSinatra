require_relative '../spec_helper'
require 'constants'

feature "Visitor enters the Homepage" do

  scenario "there are no posts" do
    visit '/'
    expect(page).to have_content 'Instructions'
  end

  scenario "clicks the instructions link" do
    visit '/'
    find_link('Instructions')[:href].should == '#instructions'
  end

  scenario "when there are posts" do
    post = Blog::DBAdapter.find_post_by_id(Blog::DBAdapter.new_post(A_TITLE, A_BODY))
    visit '/'
    find('input')[:value].should == "#{post.id}"
    expect(page).to have_content post.title
    expect(page).to have_content post.body
    expect(page).to have_content post.created_at
  end

  scenario "clicks the post link" do
    post = Blog::DBAdapter.find_post_by_id(Blog::DBAdapter.new_post(A_TITLE, A_BODY))
    visit '/'
    find_link("#{post.title}")[:href].should == "##{post.id}"
  end
end
