module Blog
  module PostManager

    DELETE = 'Delete'
    SAVE = 'Save'

    def self.manage_post(params)
      save(params) if save_action?(params)
      delete(params) if delete_action?(params)
    end

    private
    def self.delete(params)
      DBAdapter.delete_post(params[:id])
    end

    def self.delete_action?(params)
      params[:action] == DELETE
    end

    def self.save(params)
      if no_id?(params[:id]) then new_post(params)
      else edit_post(params)
      end
    end

    def self.save_action?(params)
      params[:action] == SAVE
    end

    def self.new_post(params)
      DBAdapter.new_post(params[:title], params[:body])
    end

    def self.edit_post(params)
      id = params[:id]
      title = params[:title]
      body = params[:body]
      DBAdapter.edit_post(id, { title: title, body: body })
    end

    def self.no_id?(id)
      id == '' || id == nil
    end
  end
end
