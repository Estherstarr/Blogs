class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    like = @post.likes.new(author: @user, post: @post)
    if like.save
      flash[:success] = 'You just liked this post'
      redirect_to user_post_path(@user, @post)
    else
      render 'posts/show', status: :unprocessable_entity
    end
  end
end
