class ArticlesController < ApplicationController

  # GET /articles
  def index
    context = { articles: Article.all }

    render Pages::Articles::Index::Component.new(context:)
  end

  # GET /articles/1
  def show
    context = { article: fetch_article }

    render Pages::Articles::Show::Component.new(context:)
  end

  # GET /articles/new
  def new
    context = { article: Article.new }

    render Pages::Articles::New::Component.new(context:)
  end

  # GET /articles/1/edit
  def edit
    context = { article: fetch_article }

    render Pages::Articles::Edit::Component.new(context:)
  end

  # POST /articles
  def create
    article = Article.new(article_params)

    if article.save
      response.headers['HX-Location'] = articles_url
      flash[:notice] = '記事を作成しました。'
      head :created
    else
      flash.now[:alert] = '入力内容に誤りがあります。'
      render Organisms::ArticleForm::Component.new(model: article)
    end
  end

  # PATCH/PUT /articles/1
  def update
    article = fetch_article

    if article.update(article_params)
      response.headers['HX-Location'] = article_url(article)
      flash[:notice] = '記事を更新しました。'
      head :ok
    else
      flash.now[:alert] = '入力内容に誤りがあります。'
      render Organisms::ArticleForm::Component.new(model: article)
    end
  end

  # DELETE /articles/1
  def destroy
    article = fetch_article
    article.destroy!
    response.headers['HX-Location'] = articles_url
    flash[:notice] = '記事を削除しました。'
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def fetch_article
      Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
