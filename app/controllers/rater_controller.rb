class RaterController < ApplicationController
  expose :article

  def create
    if user_signed_in?
      article.rate params[:score].to_f, current_user, params[:dimension]

      render json: true
    else
      render json: false
    end
  end
end
