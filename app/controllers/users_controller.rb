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
            # session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :created_at, :updated_at)
    end
end
