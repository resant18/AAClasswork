class CommentsController < ApplicationController
  def index
      comment = {}
      if params[:user_id]
        comment = Comment.find_by(author_id: params[:user_id])
      elsif params[:artwork_id]
        comment = Comment.all.where(artwork_id: params[:artwork_id])
      end
      render json: comment
  end

  def create
    comment = Comment.new(comments_params)

    if comment.save
      render json: comment 
    else 
      render comment.errors.full_messages, status: 422
    end
  end 

  def destroy   
    comment = Comment.find(params[:id])
    comment.destroy

    render json: comment 
  end


  private
    def comments_params
      params.require(:comments).permit(:author_id, :artwork_id, :body)
    end
end
