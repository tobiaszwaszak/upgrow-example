class CommentsController < ApplicationController
  def new
    @input = CommentInput.new(article_id: params[:article_id])
  end

  def create
    @input = CommentInput.new(comment_params)
    @input.article_id = params[:article_id]

    CreateCommentAction.new.perform(@input)
      .and_then do |comment|
        redirect_to(article_path(comment.article_id), notice: 'Comment was successfully created.')
      end
      .or_else do |errors|
        render :new
      end
  end

  def destroy
    DeleteCommentAction.new.perform(params[:id])
    redirect_to article_path(params[:article_id]), notice: 'Comment was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment_input).permit(:author, :body)
  end
end
