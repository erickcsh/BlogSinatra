module Blog
  module PostManager

    DELETE = 'Delete'
    CANCEL = 'Cancel'

    def self.manage_post(params)
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
