require 'sinatra'
require_relative 'lib/blog'

get "/" do
  erb :index
end

def posts_html
  erb :instructions_post
end

def sidebar_html
  erb :instructions_sidebar
end
