require 'constants'
require 'blog/db_adapter'

describe Blog::DBAdapter, ".new_post" do
  subject { described_class }

  before do
    post = subject.new_post(A_TITLE, A_CONTENT)
    @id = post.id
  end

  after do
    subject.delete_post(@id)
  end

  it "adds a new post with the expected title" do
    post = subject.find_post_by_id(@id)
    expect(post.title).to eq(A_TITLE)
  end

  it "adds a new post with the expected content" do
    post = subject.find_post_by_id(@id)
    expect(post.content).to eq(A_CONTENT)
  end
end
