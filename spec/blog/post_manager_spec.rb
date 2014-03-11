require 'constants'
require 'blog'

describe Blog::PostManager, ".manage_post" do
  subject { described_class }

  context "when action = #{SAVE}" do
    let(:params) { { id: EMPTY_ID, action: SAVE, title: A_TITLE, body: A_BODY} }

    after do
      subject.manage_post(params)
    end

    context "when the post is being created" do
      it "creates a new post in the DB" do
        expect(Blog::DBAdapter).to receive(:new_post).with(A_TITLE, A_BODY)
      end
    end

    context "when the post is being edited" do
      let(:params) { { id: AN_ID, action: SAVE, title: ANOTHER_TITLE, body: ANOTHER_BODY} }

      it "edits a post" do
        expect(Blog::DBAdapter).to receive(:edit_post).with(AN_ID, NEW_VALUES)
      end
    end
  end

  context "when action = #{CANCEL}" do
    let(:params) { { action: CANCEL } }

    it "does nothing" do
      expect(subject.manage_post(params)).to eq(nil)
    end
  end

  context "when action = #{DELETE}" do
    let(:params) { { action: DELETE, id: AN_ID } }

    it "deletes the post" do
      expect(Blog::DBAdapter).to receive(:delete_post).with(AN_ID)
      subject.manage_post(params)
    end
  end
end
