class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = current_user.comments.build(parent_id: params[:parent_id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render :create
    else
      render :new
    end
  end

  def edit; end

  def update
    @comment.update_attributes(comment_params)

    if @comment.save
      render :success
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Your comment has been deleted.'
    redirect_to root_path
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:message, :user_id, :parent_id)
  end
end