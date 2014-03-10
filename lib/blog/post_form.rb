module Blog
  class PostForm

    EDIT = 'Edit'
    NEW = 'New'

    attr_reader :id, :body, :title, :post_title

    def initialize(params = nil)
      if params.empty? then set_empty_values
      else set_params_values(params)
      end
    end

    private
    def set_params_values(params)
      @id = params['id']
      post = Blog::DBAdapter.find_post_by_id(@id)
      @body = post.body
      @title = post.title
      @post_title = EDIT
    end

    def set_empty_values
      @id = ''
      @body = 'Content here...'
      @title = ''
      @post_title = NEW
    end
  end
end
