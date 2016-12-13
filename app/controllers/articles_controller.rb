class ArticlesController < ApplicationController
  before_action :authorize_user!, only: %i(edit update destroy)
  before_action :authorize_domain!

  expose :company, -> { Company.find_by(domain: request.subdomain) }
  expose :article
  expose :articles, -> { company.articles.includes(:user, :assessment_average).order(created_at: :desc) }
  expose :comment, -> { article.comments.build }
  expose :comments, -> { article.comments.includes(:user).order(created_at: :desc) }

  def index
  end

  def show
  end

  def new
  end

  def create
    article.user = current_user
    article.company = company
    if article.save
      respond_with article, location: article_path(article)
    else
      flash[:alert] = "Article could not be created"
      render :new
    end
  end

  def edit
  end

  def update
    article.update(article_params)

    respond_with article, location: article_path(article)
  end

  def destroy
    article.destroy

    respond_with article, location: articles_path
  end

  private

  def authorize_user!
    authorize(article, :manage?)
  end

  def authorize_domain!
    authorize(company, :company_user?)
  end

  def article_params
    params.require(:article).permit(:name, :text)
  end
end
