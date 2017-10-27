class PostCommentsController < InheritedResources::Base

  private

    def post_comment_params
      params.require(:post_comment).permit(:name, :email, :body, :post_id)
    end

    def create
      @post_comment=PostComment.new(params[:post_comment])
      if @post_comment.save
        :flash(:notice) = "Comment has successfully saved"
        redirect_to(@post_comment.post)
      else
        :flash(:notice) = "Error #{@post_comment.errors}"
        redirect_to(@post_comment.post)
      end
    end
end
