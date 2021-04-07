class ArticleInput
  include ActiveModel::Model

  attr_accessor :title, :body

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
