class UsersController < ApplicationController 


    def index 
        render json: User.all 
    end

    def create 
       # p parameters
        user = User.new(strong_params) 
        #p user 
        if user.save 
             render json: user 
        else  
            render json: user.errors.full_messages, status: :unprocessable_entity 
        end 
    end 

    def show
        # render json: params
        user = User.find_by(id: params[:id])
        if (user)
            render json: user
        else
            render plain: 'user not found', status: :not_found
        end
    end 

    def update
        user = User.find_by(id: params[:id])
        user.update(strong_params)

        if user
            render json: user
        else
            render plain: 'user not found', status: :not_found
        end
    end

    def destroy
        destroyed_user = User.destroy_by(id: params[:id]).first
        if destroyed_user
            render json: destroyed_user
        else
            render plain: 'user not found', status: :not_found
        end
    end

    private 
    def strong_params
        params.require(:user).permit(:name, :email)
    end
end