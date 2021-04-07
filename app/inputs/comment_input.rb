class CommentInput
  include ActiveModel::Model

  attr_accessor :article_id, :author, :body

  validates :article_id, presence: true
  validates :author, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
