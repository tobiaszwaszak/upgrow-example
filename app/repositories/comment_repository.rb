class CommentRepository
  def create(input)
    record = CommentRecord.create!(
      article_id: input.article_id, author: input.author, body: input.body
    )
    to_model(record.attributes)
  end

  def delete(id)
    record = CommentRecord.find(id)
    record.destroy!
  end

  private

  def to_model(attributes)
    Comment.new(**attributes.symbolize_keys)
  end
end
