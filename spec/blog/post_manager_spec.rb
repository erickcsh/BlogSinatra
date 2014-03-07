require 'constants'
require 'blog'

describe Blog::PostManager, ".manage_post" do
  subject { described_class }

  context "when action = 'Save'" do

  end

  context "when action = 'Cancel'" do
    let(:params) { double(:params, action: 'Cancel').as_null_object }

    it "does nothing" do
      expect(subject.manage_post(params)).to eq(nil)
    end
  end

  context "when action = 'Delete'" do

  end
end
