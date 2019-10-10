class CommentsController < ApplicationController
    before_action :require_sign_in
    before_action :require_comment_owner

    def new
        @comment = Comment.new
        @comment.post_id = params[:post_id]
        render :new
    end

    def create
        # doesn't need to whitelist :author_id if calling current_user here
        @comment = current_user.comments.new(comment_params)

        if @comment.save!
            redirect_to post_url(@comment.post_id)
        else
            flash[:errors] = @comment.errors.full_messages            
            redirect_to new_post_comment_url(@comment.post_id)
        end
    end

    def comment_params
        params.require(:comment).permit(:content, :parent_comment_id, :post_id)
    end
end
