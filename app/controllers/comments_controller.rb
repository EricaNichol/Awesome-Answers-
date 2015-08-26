class CommentsController < ApplicationController

    def create
      @comment   = Comment.new comment_params
      @product = Product.find params[:product_id]
      @comment.product = @product
      @comment.save
      if @comment.save
      redirect_to product_path(@product), notice: "Comment Created!"
      else
        flash[:alert] = "Comment wasn't created"
        render "/products/show"
      end
    end

    def destroy
      @product = Product.find params[:product_id]
      @comment = Comment.find params[:id]
      @comment.destroy
      redirect_to product_path(@product), notice: "Comment deleted"
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
