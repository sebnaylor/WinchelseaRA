class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post: @post, user_name: current_user.name, text: params[:comment][:text])
    @comment.save
    redirect_to post_path(@post)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:text)
  end

end
