require_relative '../spec_helper'
require 'constants'

describe "Action page" do
  before do
    allow(Blog::PostManager).to receive(:manage_post)
    allow(Kernel).to receive(:redirect)
  end

  it "manages the post" do
    expect(Blog::PostManager).to receive(:manage_post)
    post "/action"
  end
end
