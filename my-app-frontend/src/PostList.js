import React from 'react';
import PostItem from './PostItem';

const PostList = ({ posts }) => {
  return (
    <div className="post-list">
      <h2>All Posts</h2>
      {posts.map(post => (
        <PostItem key={post.id} post={post} />
      ))}
    </div>
  );
};

export default PostList;
