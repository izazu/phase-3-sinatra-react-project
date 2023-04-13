# app/models/user.rb
class User < ActiveRecord::Base
    has_many :posts
    # other associations and validations
  end
  
  # app/models/post.rb
  class Post < ActiveRecord::Base
    belongs_to :user
    # other associations and validations
  end
  