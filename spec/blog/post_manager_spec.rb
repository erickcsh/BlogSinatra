require 'constants'
require 'blog'

describe Blog::PostManager, ".manage_post" do
  subject { described_class }

  context "when action = 'Save'" do

  end

  context "when action = #{CANCEL}" do
    let(:params) { double(:params, action: CANCEL).as_null_object }

    it "does nothing" do
      expect(subject.manage_post(params)).to eq(nil)
    end
  end

  context "when action = #{DELETE}" do
    let(:params) { double(:params, action: DELETE, id: AN_ID).as_null_object }

    it "deletes the post" do
      expect(Blog::DBAdapter).to receive(:delete_post).with(AN_ID)
      subject.manage_post(params)
    end
  end
end
