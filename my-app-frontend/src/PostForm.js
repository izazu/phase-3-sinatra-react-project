import React, { useState } from 'react';

const PostForm = ({ addPost }) => {
  const [title, setTitle] = useState('');
  const [content, setContent] = useState('');
  const [author, setAuthor] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    if (title && content && author) {
      const newPost = { title, content, author };
      addPost(newPost);
      setTitle('');
      setContent('');
      setAuthor('');
    }
  };

  return (
    <form className="post-form" onSubmit={handleSubmit}>
      <h2>Add a New Post</h2>
      <input
        type="text"
        placeholder="Title"
        value={title}
        onChange={(e) => setTitle(e.target.value)}
      />
      <textarea
        placeholder="Content"
        value={content}
        onChange={(e) => setContent(e.target.value)}
      />
      <input
        type="text"
        placeholder="Author"
        value={author}
        onChange={(e) => setAuthor(e.target.value)}
      />
      <button type="submit">Submit</button>
    </form>
  );
};

const BlogList = ({ blogs, deleteBlog }) => {
  return (
    <div className="blog-list">
      <h2>All Blogs</h2>
      {blogs.map((blog) => (
        <div key={blog.id} className="blog-item">
          <h3>{blog.title}</h3>
          <p>{blog.content}</p>
          <p>Author: {blog.author}</p>
          <button onClick={() => deleteBlog(blog.id)}>Delete</button>
        </div>
      ))}
    </div>
  );
};

const App = () => {
  const [blogs, setBlogs] = useState([]);

  const addPost = (newPost) => {
    const postId = new Date().getTime().toString();
    const updatedBlogs = [...blogs, { ...newPost, id: postId }];
    setBlogs(updatedBlogs);
  };

  const deleteBlog = (postId) => {
    const updatedBlogs = blogs.filter((blog) => blog.id !== postId);
    setBlogs(updatedBlogs);
  };

  return (
    <div>
      <PostForm addPost={addPost} />
      <BlogList blogs={blogs} deleteBlog={deleteBlog} />
    </div>
  );
};

export default App;
