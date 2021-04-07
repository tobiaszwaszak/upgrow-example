class Article
  class AssocationNotLoadedError < StandardError; end

  attr_reader :id, :title, :body, :created_at, :updated_at

  def initialize(id:, title:, body:, created_at:, updated_at:, comments: nil)
    @id = id
    @title = title
    @body = body
    @created_at = created_at
    @updated_at = updated_at
    @comments = comments
  end

  def comments
    raise AssocationNotLoadedError if @comments.nil?
    @comments
  end
end
