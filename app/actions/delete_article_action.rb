class DeleteArticleAction < Action
  def perform(id)
    ArticleRepository.new.delete(id)
    result.success
  end
end
