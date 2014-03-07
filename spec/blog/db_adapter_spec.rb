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

describe Blog::DBAdapter, ".find_post_by_id" do
  subject { described_class }

  before do
    @id = subject.new_post(A_TITLE, A_CONTENT)
  end

  after do
    subject.delete_post(@id)
  end

  it "selects the post with the id" do
    post = subject.find_post_by_id(@id)
    expect(post.title).to eq(A_TITLE)
  end
end

describe Blog::DBAdapter, ".find_all_posts" do
  subject { described_class }

  before do
    @id1 = subject.new_post(A_TITLE, A_CONTENT)
    @id2 = subject.new_post(A_TITLE, A_CONTENT)
  end

  after do
    subject.delete_post(@id1)
    subject.delete_post(@id2)
  end

  it "selects all the posts" do
    post = subject.find_all_posts
    expect(post.size).to eq(2)
  end
end

describe Blog::DBAdapter, ".find_all_posts_ordered_by" do
  subject { described_class }

  before do
    @id1 = subject.new_post(A_TITLE, A_CONTENT)
    @id2 = subject.new_post(A_TITLE, A_CONTENT)
  end

  after do
    subject.delete_post(@id1)
    subject.delete_post(@id2)
  end

  it "selects all the posts ordered by created date descendant" do
    post = subject.find_all_posts_ordered_by('created_at', 'DESC')
    expect(post[0].id).to eq(@id2)
    expect(post[1].id).to eq(@id2)
  end
end
