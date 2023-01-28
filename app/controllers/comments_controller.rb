class CommentsController < ApplicationController
  def new; end

  def create
    @post = Post.find(params[:id])
    comment = @post.comments.new(comment_params.merge(author: current_user))
    if comment.save
      flash[:success] = 'Success'

      redirect_to user_post_path(current_user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.permit(:text)
  end
end