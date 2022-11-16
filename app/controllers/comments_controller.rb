class CommentsController < ApplicationController
    def index
        comments = Comment.all
        render json: comments
    end
    def show
        comment = Comment.find_by(id:params[:id])
        render json: comment
    end
    def create
        comment = Comment.create(comment_params)
        if comment.valid?
            render json: comment, status: :created
        else
            render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
        end
    end
    def update
        comment = Comment.find_by(id: params[:id])
        if comment
            comment.update(comment_params)
            render json: comment
        else
            render json: {error: "Not Found"}, status: :not_found
        end
    end
    def destroy
        comment = Comment.find_by(id:params[:id])
        if comment
            comment.destroy
        else
            render json: {error: "Not Found"}, status: :not_found
        end
    end

    private

    def comment_params
        params.permit(:user_id, :post_id, :content)
    end
end
