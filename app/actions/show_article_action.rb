class ShowArticleAction < Action
  result :article

  def perform(id)
    article = ArticleRepository.new.find_with_comments(id)

    result.success(article: article)
  end
end
