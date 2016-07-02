class CommentsController < ApplicationController
  def new
    @comment = current_user.comments.build(parent_id: params[:parent_id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @comment = Comment.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html {
          flash[:success] = 'Your comment was successfully added!'
          redirect_to root_url
        }
        format.js
      else
        format.html {
          flash[:danger] = 'Error: An error has occurred in posting comment process.'
          render :new
        }
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :user_id, :parent_id)
  end
end