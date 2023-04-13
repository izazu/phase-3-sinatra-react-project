import React, { useState, useEffect } from 'react';
import PostList from './PostList';
import PostForm from './PostForm';
import './App.css';

const App = () => {
  const [posts, setPosts] = useState([]);

  // Fetch all posts from backend on component mount
  useEffect(() => {
    fetch('/posts')
      .then(response => response.json())
      .then(data => setPosts(data))
      .catch(error => console.error('Error fetching posts:', error));
  }, []);

  // Add a new post
  const addPost = (post) => {
    fetch('/posts', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(post),
    })
      .then(response => response.json())
      .then(data => {
        setPosts([...posts, data]);
      })
      .catch(error => console.error('Error adding post:', error));
  };

  return (
    <div className="app-container">
      <h1>Blog App for Writers</h1>
      <PostForm addPost={addPost} />
      <PostList posts={posts} />
    </div>
  );
};

export default App;


