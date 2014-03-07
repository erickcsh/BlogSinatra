require_relative '../spec_helper'
require 'constants'

describe "Index page" do
  context "when there are no posts" do
    it "displays the Instructions post" do
      get '/'
      expect(last_response.body).to include(INSTRUCTIONS_POST_SLICE)
    end

    it "displays the Instructions sidebar" do
      get '/'
      expect(last_response.body).to include(INSTRUCTIONS_SIDEBAR_SLICE)
    end
  end
end
