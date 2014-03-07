require 'sinatra'
require_relative 'lib/blog'

get "/" do
  erb :instructions_post
end

