require 'sinatra'
require_relative 'lib/blog'

get "/" do
  @posts = Blog::DBAdapter.find_all_posts_ordered_by('created_at')
  erb :index
end

def posts_html
  if(@posts.empty?) then erb :instructions_post
  else posts_body
  end
end

def posts_body
  @posts.reduce('') do |content, post| 
    @post = post
    content << (erb :post) 
  end
end

def sidebar_html
  erb :instructions_sidebar
end
