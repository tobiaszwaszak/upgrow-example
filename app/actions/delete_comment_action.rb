class DeleteCommentAction < Action
  def perform(id)
    CommentRepository.new.delete(id)
    result.success
  end
end
