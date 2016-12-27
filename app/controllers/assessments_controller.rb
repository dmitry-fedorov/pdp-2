class AssessmentsController < ApplicationController
  expose(:assessment)

  def create
    assessment.save

    render nothing: true, status: :ok
  end

  private

  def assessment_params
    params.fetch(:assessment).permit(:article_id, :assessment).merge(user_id: current_user.id)
  end
end
