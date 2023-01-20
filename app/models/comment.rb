class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comment_counter
    Post.find(post_id).update(comments_counter: Post.find(post_id).comments.count)
  end
end
