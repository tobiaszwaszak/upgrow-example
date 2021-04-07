class ArticlesController < ApplicationController
  # GET /articles
  def index
    @articles = ListArticlesAction.new.perform.articles
  end

  # GET /articles/1
  def show
    @article = ShowArticleAction.new.perform(params[:id]).article
  end

  # GET /articles/new
  def new
    @input = ArticleInput.new
  end

  # GET /articles/1/edit
  def edit
    article = EditArticleAction.new.perform(params[:id]).article
    @input = ArticleInput.new(title: article.title, body: article.body)
  end

  # POST /articles
  def create
    @input = ArticleInput.new(article_params)

    CreateArticleAction.new.perform(@input)
      .and_then do |article|
        redirect_to(article_path(article.id), notice: 'Article was successfully created.')
      end
      .or_else do |errors|
        render :new
      end
  end

  # PATCH/PUT /articles/1
  def update
    @input = ArticleInput.new(article_params)

    UpdateArticleAction.new.perform(params[:id], @input)
      .and_then do |article|
        redirect_to(article_path(article.id), notice: 'Article was successfully updated.')
      end
      .or_else do |errors|
        render :edit
      end
  end

  # DELETE /articles/1
  def destroy
    DeleteArticleAction.new.perform(params[:id])
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article_input).permit(:title, :body)
  end
end
