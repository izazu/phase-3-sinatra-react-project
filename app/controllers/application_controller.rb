require 'sinatra/base'
require 'json'
require_relative '../models/user' # Replace with your User model
require_relative '../models/post' # Replace with your Post model

class ApplicationController < Sinatra::Base
  get '/' do
    content_type :json
    { message: 'Welcome to Blog App for Writers!' }.to_json
  end

  # Example route for getting all users
  get '/users' do
    content_type :json
    users = User.all
    users.to_json
  end

  # Example route for getting a specific user by ID
  get '/users/:id' do
    content_type :json
    user = User.find(params[:id])
    user.to_json
  end

  # Example route for creating a new user
  post '/users' do
    content_type :json
    user = User.new(params[:user])
    if user.save
      { message: 'User created successfully' }.to_json
    else
      { error: 'Failed to create user' }.to_json
    end
  end

  # Example route for updating a user by ID
  put '/users/:id' do
    content_type :json
    user = User.find(params[:id])
    if user.update(params[:user])
      { message: 'User updated successfully' }.to_json
    else
      { error: 'Failed to update user' }.to_json
    end
  end

  # Example route for deleting a user by ID
  delete '/users/:id' do
    content_type :json
    user = User.find(params[:id])
    if user.destroy
      { message: 'User deleted successfully' }.to_json
    else
      { error: 'Failed to delete user' }.to_json
    end
  end

  # Example route for getting all posts
  get '/posts' do
    content_type :json
    posts = Post.all
    posts.to_json
  end

  # Example route for getting a specific post by ID
  get '/posts/:id' do
    content_type :json
    post = Post.find(params[:id])
    post.to_json
  end

  # Example route for creating a new post
  post '/posts' do
    content_type :json
    post = Post.new(params[:post])
    if post.save
      { message: 'Post created successfully' }.to_json
    else
      { error: 'Failed to create post' }.to_json
    end
  end

  # Example route for updating a post by ID
  put '/posts/:id' do
    content_type :json
    post = Post.find(params[:id])
    if post.update(params[:post])
      { message: 'Post updated successfully' }.to_json
    else
      { error: 'Failed to update post' }.to_json
    end
  end

  # Example route for deleting a post by ID
  delete '/posts/:id' do
    content_type :json
    post = Post.find(params[:id])
    if post.destroy
      { message: 'Post deleted successfully' }.to_json
    else
      { error: 'Failed to delete post' }.to_json
    end
  end
end
