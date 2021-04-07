class ArticleRepository
  def all
    ArticleRecord.all.includes(:comment_records).map do |record|
      comments = record.comment_records.map do |comment_record|
        to_comment_model(comment_record.attributes)
      end

      to_model(record.attributes.merge(comments: comments))
    end
  end

  def create(input)
    record = ArticleRecord.create!(
      title: input.title, body: input.body
    )
    to_model(record.attributes)
  end

  def find(id)
    record = ArticleRecord.find(id)
    to_model(record.attributes)
  end

  def find_with_comments(id)
    record = ArticleRecord.find(id)

    comments = record.comment_records.map do |comment_record|
      to_comment_model(comment_record.attributes)
    end

    to_model(record.attributes.merge(comments: comments))
  end

  def update(id, input)
    record = ArticleRecord.find(id)
    record.update!(
      title: input.title, body: input.body
    )
    to_model(record.attributes)
  end

  def delete(id)
    record = ArticleRecord.find(id)
    record.destroy!
  end

  private

  def to_model(attributes)
    Article.new(**attributes.symbolize_keys)
  end

  def to_comment_model(attributes)
    Comment.new(**attributes.symbolize_keys)
  end
end
