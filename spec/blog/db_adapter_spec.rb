require 'constants'
require 'blog'

describe Blog::DBAdapter, ".new_post" do
  subject { described_class }

  before do
    @id = subject.new_post(A_TITLE, A_BODY)
  end

  after do
    subject.delete_post(@id)
  end

  it "adds a new post with the expected title" do
    post = subject.find_post_by_id(@id)
    expect(post.title).to eq(A_TITLE)
  end

  it "adds a new post with the expected body" do
    post = subject.find_post_by_id(@id)
    expect(post.body).to eq(A_BODY)
  end
end

describe Blog::DBAdapter, ".delete_post" do
  subject { described_class }

  before do
    @id = subject.new_post(A_TITLE, A_BODY)
  end

  it "deletes the post with the id" do
    subject.delete_post(@id)
    expect { subject.find_post_by_id(@id) }.to raise_error
  end
end

describe Blog::DBAdapter, ".find_post_by_id" do
  subject { described_class }

  before do
    @id = subject.new_post(A_TITLE, A_BODY)
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
    @id1 = subject.new_post(A_TITLE, A_BODY)
    @id2 = subject.new_post(A_TITLE, A_BODY)
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
    @id1 = subject.new_post(A_TITLE, A_BODY)
    @id2 = subject.new_post(A_TITLE, A_BODY)
  end

  after do
    subject.delete_post(@id1)
    subject.delete_post(@id2)
  end

  it "selects all the posts ordered by created date descendant" do
    post = subject.find_all_posts_ordered_by('created_at')
    expect(post[0].id).to eq(@id2)
    expect(post[1].id).to eq(@id1)
  end
end

describe Blog::DBAdapter, ".edit_post" do
  subject { described_class }

  before do
    @id = subject.new_post(A_TITLE, A_BODY)
  end

  after do
    subject.delete_post(@id)
  end

  it "edits the post's title and body" do
    subject.edit_post(@id, NEW_VALUES)
    post = subject.find_post_by_id(@id)
    expect(post.title).to eq(ANOTHER_TITLE)
    expect(post.body).to eq(ANOTHER_BODY)
  end
end
