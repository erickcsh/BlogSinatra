require 'constants'
require 'blog'

describe Blog::DBAdapter, ".new_post" do
  subject { described_class }

  before do
    @id = subject.new_post(A_TITLE, A_CONTENT)
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
    expect(post.body).to eq(A_CONTENT)
  end
end

describe Blog::DBAdapter, ".delete_post" do
  subject { described_class }

  before do
    @id = subject.new_post(A_TITLE, A_CONTENT)
  end

  it "deletes the post with the id" do
    subject.delete_post(@id)
    expect { subject.find_post_by_id(@id) }.to raise_error
  end
end

