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
      DBAdapter.new_post(params[:title], params[:body])
    end

    def self.save_action?(params)
      params[:action] == SAVE
    end
  end
end
