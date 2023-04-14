require 'sinatra/base'
require 'json'
require_relative '../models/user' # Replace with your User model
require_relative '../models/post' # Replace with your Post model

class ApplicationController < Sinatra::Base
  get '/' do
    content_type :json
    { message: 'Welcome to Blog App for Writers!' }.to_json
  end

  
  get '/users' do
    content_type :json
    users = User.all
    users.to_json
  end

  
  get '/users/:id' do
    content_type :json
    user = User.find(params[:id])
    user.to_json
  end

  
  post '/users' do
    content_type :json
    user = User.new(params[:user])
    if user.save
      { message: 'User created successfully' }.to_json
    else
      { error: 'Failed to create user' }.to_json
    end
  end

  
  put '/users/:id' do
    content_type :json
    user = User.find(params[:id])
    if user.update(params[:user])
      { message: 'User updated successfully' }.to_json
    else
      { error: 'Failed to update user' }.to_json
    end
  end

  
  delete '/users/:id' do
    content_type :json
    user = User.find(params[:id])
    if user.destroy
      { message: 'User deleted successfully' }.to_json
    else
      { error: 'Failed to delete user' }.to_json
    end
  end

  
  get '/posts' do
    content_type :json
    posts = Post.all
    posts.to_json
  end

  
  get '/posts/:id' do
    content_type :json
    post = Post.find(params[:id])
    post.to_json
  end

  
  post '/posts' do
    content_type :json
    post = Post.new(params[:post])
    if post.save
      { message: 'Post created successfully' }.to_json
    else
      { error: 'Failed to create post' }.to_json
    end
  end

  
  put '/posts/:id' do
    content_type :json
    post = Post.find(params[:id])
    if post.update(params[:post])
      { message: 'Post updated successfully' }.to_json
    else
      { error: 'Failed to update post' }.to_json
    end
  end

  
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
