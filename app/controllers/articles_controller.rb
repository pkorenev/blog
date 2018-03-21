class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :create_comment]
  def index
    @articles = Article.published
  end

  def show
    @article_comments = @article.comments
  end

  def create_comment
    comment = @article.comments.create(comment_params)
    if comment.persisted?
      render template: "application/_comment", locals: {comment: comment}, layout: false
    else
      render inline: comment.errors.inspect, status: 400
    end

  end

  def set_article
    @article = Article.published.find(params[:id]) rescue nil

    if !@article
      return render_not_found
    end
  end

  def comment_params
    h = params.require(:comment).permit(:comment_text)
    h[:user_id] ||= current_user.try(:id)

    h
  end
end
