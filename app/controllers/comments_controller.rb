class CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = @user.posts.find(params[:post_id]).comments
    respond_to do |format|
      format.json do
        render json: @comments, status: :ok
      end
    end
  end

  def create
    @post = Post.find(params[:id])
    comment = @post.comments.new(comment_params.merge(author: current_user))

    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Success'
          redirect_to user_post_path(current_user, @post)
        else
          render :new, status: :unprocessable_entity
        end
      end

      format.json do
        if comment.save
          render json: { success: true }, status: :ok
        else
          render json: { success: false }, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to user_post_path(current_user, @comment.post), status: :see_other
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.permit(:text)
  end
end
