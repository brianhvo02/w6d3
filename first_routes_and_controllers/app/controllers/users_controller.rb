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
        render json: params 
    end 

    private 
    def strong_params
        params.require(:user).permit(:name, :email)
    end
end