class HomeController < ApplicationController
  def index
    @root_comment         = Comment.root
    @descendant_comments  = @root_comment.children.order(created_at: :desc)
  end
end