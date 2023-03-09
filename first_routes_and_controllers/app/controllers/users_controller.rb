class UsersController < ApplicationController 


    def index 
        render json: User.all 
    end

    def create 
        user = User.new(user_params)
        if user.save 
            render json: user, status: :created
        else  
            render json: user.errors.full_messages, status: :unprocessable_entity 
        end 
    end 

    def show
        user = User.find_by(id: params[:id])
        if (user)
            render json: user
        else
            render plain: 'user not found', status: :not_found 
        end
    end 

    def update
        user = User.find_by(id: params[:id])
        
        if user && user.update(user_params)
            render json: user
        else
            render plain: 'user not found', status: :unprocessable_entity 
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user && user.destroy
            render json: user
        else
            render plain: 'user not found', status: :not_found 
        end
    end

    private 
    def user_params
        params.require(:user).permit(:username)
    end
end