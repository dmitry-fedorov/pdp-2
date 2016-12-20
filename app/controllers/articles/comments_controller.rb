module Articles
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_user!, only: %i(update destroy)

    expose :article
    expose :comment

    def create
      comment.user = current_user
      comment.save

      render partial: "comment"
    end

    def update
      render json: comment if comment.update(comment_params)
    end

    def destroy
      comment.destroy

      render nothing: true, status: :ok
    end

    private

    def authorize_user!
      authorize(comment, :manage?)
    end

    def comment_params
      params.require(:comment).permit(:text).merge(article_id: article.id)
    end
  end
end
