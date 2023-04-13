require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/cors'
require 'json'
require './models/post'
require './models/comment'

configure :development do
  require 'dotenv'
  Dotenv.load
end

configure do
  enable :cross_origin
end

# CORS configuration
set :allow_origin, :any
set :allow_methods, [:get, :post, :put, :delete, :options]
set :allow_credentials, true

# Routes

# Create a new post
post '/posts' do
  content_type :json
  post = Post.new(JSON.parse(request.body.read))
  if post.save
    post.to_json
  else
    halt 500, { message: 'Failed to create post' }.to_json
  end
end

# Retrieve all posts
get '/posts' do
  content_type :json
  posts = Post.all
  posts.to_json
end

# Retrieve a specific post
get '/posts/:id' do
  content_type :json
  post = Post.find(params[:id])
  post.to_json
end

# Update a post
put '/posts/:id' do
  content_type :json
  post = Post.find(params[:id])
  if post.update(JSON.parse(request.body.read))
    post.to_json
  else
    halt 500, { message: 'Failed to update post' }.to_json
  end
end

# Delete a post
delete '/posts/:id' do
  content_type :json
  post = Post.find(params[:id])
  if post.destroy
    { message: 'Post deleted' }.to_json
  else
    halt 500, { message: 'Failed to delete post' }.to_json
  end
end

# Create a new comment
post '/comments' do
  content_type :json
  comment = Comment.new(JSON.parse(request.body.read))
  if comment.save
    comment.to_json
  else
    halt 500, { message: 'Failed to create comment' }.to_json
  end
end

# Retrieve all comments for a specific post
get '/posts/:id/comments' do
  content_type :json
  comments = Comment.where(post_id: params[:id])
  comments.to_json
end

# Update a comment
put '/comments/:id' do
  content_type :json
  comment = Comment.find(params[:id])
  if comment.update(JSON.parse(request.body.read))
    comment.to_json
  else
    halt 500, { message: 'Failed to update comment' }.to_json
  end
end

# Delete a comment
delete '/comments/:id' do
  content_type :json
  comment = Comment.find(params[:id])
  if comment.destroy
    { message: 'Comment deleted' }.to_json
  else
   
