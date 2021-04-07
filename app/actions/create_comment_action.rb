class CreateCommentAction < Action
  result :comment

  def perform(input)
    if input.valid?
      comment = CommentRepository.new.create(input)
      result.success(comment: comment)
    else
      result.failure(input.errors)
    end
  end
end
