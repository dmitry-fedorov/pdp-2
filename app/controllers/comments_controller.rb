class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: %i(update destroy)

  expose :article
  expose :comment
  expose :comments, -> { article.comments.includes(:user).order(created_at: :desc) }

  def create
    comment.user = current_user
    comment.save

    render "_comments", layout: false
  end

  def update
    comment.update(comment_params)

    render "_edit_form", layout: false
  end

  def destroy
    comment.destroy

    render "_comments", layout: false
  end

  private

  def authorize_user!
    authorize(comment, :manage?)
  end

  def comment_params
    params.require(:comment).permit(:text).merge(article_id: article.id)
  end
end

