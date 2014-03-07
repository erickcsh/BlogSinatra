module Blog
  module PostManager

    DELETE = 'Delete'
    SAVE = 'Save'

    def self.manage_post(params)
      DBAdapter.new_post(params[:title], params[:body]) if params[:action] == SAVE
      delete(params) if delete_action?(params)
    end

    private
    def self.delete(params)
      DBAdapter.delete_post(params[:id])
    end

    def self.delete_action?(params)
      params[:action] == DELETE
    end
  end
end
