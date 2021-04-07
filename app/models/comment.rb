class Comment
  attr_reader :id, :article_id, :author, :body, :created_at, :updated_at

  def initialize(id:, article_id:, author:, body:, created_at:, updated_at:)
    @id = id
    @article_id = article_id
    @author = author
    @body = body
    @created_at = created_at
    @updated_at = updated_at
  end
end
