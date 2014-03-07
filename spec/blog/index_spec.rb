require_relative '../spec_helper'
require 'constants'

describe "Index page" do
  before { allow(Blog::DBAdapter).to receive(:find_all_posts_ordered_by) { posts } }

  context "when there are no posts" do
    let(:posts) { [] }

    it "displays the Instructions post" do
      get '/'
      expect(last_response.body).to include(INSTRUCTIONS_POST_SLICE)
    end

    it "displays the Instructions sidebar" do
      get '/'
      expect(last_response.body).to include(INSTRUCTIONS_SIDEBAR_SLICE)
    end
  end

  context "when there are posts" do
    let(:post) { double(:post, id: AN_ID, title: A_TITLE, body: A_BODY, created_at: A_DATE) }
    let(:posts) { [post] }

    it "hides the post id" do
      get '/'
      expect(last_response.body).to include(POST_SILCE_ID)
    end
  end
end
