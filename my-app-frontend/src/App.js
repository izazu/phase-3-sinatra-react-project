import React, { useState, useEffect } from 'react';
import PostList from './PostList';
import PostForm from './PostForm';
import $ from 'jquery';
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

// JavaScript/jQuery for black and white toggle
  $(document).ready(function() {
  // Get the toggle switch element
  var bwToggle = $('#bw-toggle');

  // Add event listener for toggle switch change
  bwToggle.on('change', function() {
    // Check if toggle switch is checked (i.e., black and white mode is enabled)
    if (bwToggle.is(':checked')) {
      // Add the black-and-white CSS class to the app container element
      $('.app-container').addClass('black-and-white');
    } else {
      // Remove the black-and-white CSS class from the app container element
      $('.app-container').removeClass('black-and-white');
    }
  });
});



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


