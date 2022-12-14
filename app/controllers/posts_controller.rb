class PostsController < ApplicationController
    # skip_before_action :verify_authenticity_token

    def index
        posts = Post.all
        render json: posts
    end
    def show
        post = Post.find_by(id:params[:id])
        render json: post
    end
    def create
        post = Post.create(post_params)
        if post.valid?
            render json: post, status: :created
        else
            render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
        end
    end
    def update
        post = Post.find_by(id: params[:id])
        if post
            post.update(post_params)
            render json: post
        else
            render json: {error: "Not Found"}, status: :not_found
        end
    end
    def destroy
        post = Post.find_by(id:params[:id])
        if post
            post.destroy
        else
            render json: {error: "Not Found"}, status: :not_found
        end
    end

    private 

    def post_params
        params.permit(:user_id, :content, :likes)
    end
    
end
