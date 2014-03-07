module Blog
  module DBAdapter

    def self.new_post(title, body)
      post = Post.new(title: title, body: body)
      post.save
      post.id
    end

    def self.delete_post(id)
      Post.delete(id)
    end

    def self.find_post_by_id(id)
      Post.find(id)
    end

    def self.find_all_posts
      Post.all
    end

    def self.find_all_posts_ordered_by(column, order = 'DESC')
      find_all_posts.order("#{column} #{order}")
    end
  end
end
