class CommentsController < ApplicationController

  def create
    @new_comment = Comment.new(comment_params)
    @new_comment.post_id = params[:post_id]
    if @new_comment.save
      render json: @new_comment
    end
  end

  def show
    @comment = params[:id]
    @flags = @comment.flags

    render :json => {:comments => @comments,
                    :flags => @flags}
  end

  def update
    @comment_to_update = Comment.find(params[:id])
    if @comment_to_update.update(comment_params)
      render json: @comment_to_update
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      return {status: 200}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
