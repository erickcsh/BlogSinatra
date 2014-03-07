module Blog
  module PostManager

    DELETE = 'Delete'
    CANCEL = 'Cancel'

    def self.manage_post(params)
      DBAdapter.delete_post(params[:id]) if params[:action] == DELETE
    end
  end
end
