require 'constants'
require 'blog'

describe Blog::PostManager, ".manage_post" do
  subject { described_class }

  context "when action = 'Save'" do

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
