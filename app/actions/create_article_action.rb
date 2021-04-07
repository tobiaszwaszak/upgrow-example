class CreateArticleAction < Action
  result :article

  def perform(input)
    if input.valid?
      article = ArticleRepository.new.create(input)
      result.success(article: article)
    else
      result.failure(input.errors)
    end
  end
end
