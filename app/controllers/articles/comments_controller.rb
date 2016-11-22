module Articles
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_user!, only: %i(update destroy)

    expose :article
    expose :comment

    def create
      comment.article = article
      comment.user = current_user
      comment.save

      render partial: "comment"
    end

    def update
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
      params.require(:comment).permit(:text)
    end
  end
end
