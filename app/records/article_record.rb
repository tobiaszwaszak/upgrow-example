class ArticleRecord < ApplicationRecord
  self.table_name = 'articles'

  has_many :comment_records, foreign_key: :article_id, dependent: :destroy
end
