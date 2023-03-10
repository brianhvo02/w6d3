class CommentsController < ApplicationController


    def index 
        if params.has_key?(:user_id)
            render json: Comment.where(author_id: params[:user_id])
        elsif  params.has_key?(:artwork_id)
            render json: Comment.where(artwork_id: params[:artwork_id])
        else   
            render json: Comment.all 
        end 
    end 

    def create 
        comment = Comment.new(comment_params)
        if comment.save 
            render json: comment 
        else  
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end 
    end 

    def destroy 
        comment = Comment.find_by(id: params[:id])
        if comment && comment.destroy 
            render json: comment  
        else  
            render plain: "comment not found", status: :not_found 
        end 
    end 

    private 
    def comment_params
        params.require(:comment).permit(:body, :author_id, :artwork_id) 
    end

end 