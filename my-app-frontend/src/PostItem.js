import React from 'react';

const PostItem = ({ post }) => {
  return (
    <div className="post-item">
      <h3>{post.title}</h3>
      <p>{post.content}</p>
      <p>Posted by: {post.author}</p>
    </div>
  );
};

export default PostItem;
