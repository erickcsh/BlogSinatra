require 'sinatra'
require_relative 'lib/blog'

get "/" do
  @posts = Blog::DBAdapter.find_all_posts_ordered_by('created_at')
  erb :index
end

post "/post" do
  post_form_action(params)
end

get "/post" do
  post_form_action(params)
end

post "/action" do
  Blog::PostManager.manage_post(params)
  redirect '/'
end

def post_form_action(params)
  @form = Blog::PostForm.new(params)
  erb :post_form
end

def posts_html
  @posts.empty? ? instructions_body : posts_body
end

def instructions_body
  erb :instructions_post
end

def posts_body
  @posts.reduce('') do |content, post| 
    @post = post
    content << (erb :post) 
  end
end

def sidebar_html
  @posts.empty? ? instructions_sidebar : posts_sidebar
end

def instructions_sidebar
  erb :instructions_sidebar
end

def posts_sidebar
  @posts.reduce('') do |content, post|
    @post = post
    content << (erb :posts_sidebar)
  end
end
