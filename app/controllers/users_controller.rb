class UsersController < ApplicationController
    # skip_before_action :verify_authenticity_token

    def index
        users = User.all
        render json: users
    end
    def show
        user = User.find_by(id:params[:id])
        render json: user
    end
    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end
    def update
        user = User.find_by(id: params[:id])
        if user
            user.update(user_params)
            render json: user
        else
            render json: {error: "Not Found"}, status: :not_found
        end
    end
    def destroy
        user = User.find_by(id:params[:id])
        if user
            user.destroy
        else
            render json: {error: "Not Found"}, status: :not_found
        end
    end

    private

    def user_params
        params.permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :created_at, :updated_at)
    end
end
