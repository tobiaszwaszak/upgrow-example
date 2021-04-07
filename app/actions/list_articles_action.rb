class ListArticlesAction < Action
  result :articles

  def perform
    result.success(articles: ArticleRepository.new.all)
  end
end
