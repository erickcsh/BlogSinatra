require_relative '../spec_helper'
require 'constants'

describe "Post Form page" do
  context "when editing a post" do
    before do
      @id = Blog::DBAdapter.new_post(A_TITLE, A_BODY)
    end

    after do
      Blog::DBAdapter.delete_post(@id)
    end

    let(:params) { { 'id' => @id } }
    it "hides the post id" do
      post "/post", params
      expect(last_response.body).to include('<input type="hidden" name="id" value="' + "#{@id}" + '"/>')
    end

    it "shows the 'Edit' title" do
      post "/post", params
      expect(last_response.body).to include('<h2>Edit</h2>')
    end

    it "shows the post title" do
      post "/post", params
      expect(last_response.body).to include('<input id="name" type="text" name="title" value="' + "#{A_TITLE}" + '"/>')
    end

    it "shows the post body" do
      post "/post", params
      expect(last_response.body).to include('<textarea id="content" name="body">' + "#{A_BODY}" + '</textarea>')
    end
  end

  context "when adding a post" do
    it "hides the '' id" do
      post "/post"
      expect(last_response.body).to include('<input type="hidden" name="id" value=""/>')
    end

    it "shows the 'New' title" do
      post "/post"
      expect(last_response.body).to include('<h2>New</h2>')
    end

    it "shows the '' title" do
      post "/post"
      expect(last_response.body).to include('<input id="name" type="text" name="title" value=""/>')
    end

    it "shows the 'Content here...' body" do
      post "/post"
      expect(last_response.body).to include('<textarea id="content" name="body">Content here...</textarea>')
    end
  end
end
