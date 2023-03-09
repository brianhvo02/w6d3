class ArtworksController < ApplicationController
    def index
        if params.has_key?(:user_id)
            render json: Artwork.joins(:artwork_shares).where("artist_id = ? OR viewer_id = ?",params[:user_id], params[:user_id])
            
        else   
            render json: Artwork.all 
        end 
    end
    
    def create
        artwork = Artwork.new(artwork_params)

        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find_by(id: params[:id])

        if artwork
            render json: artwork
        else
            render plain: 'artwork not found', status: :not_found
        end
    end

    def update
        artwork = Artwork.find_by(id: params[:id])

        if artwork && artwork.update(artwork_params)
            render json: artwork
        else
            render plain: 'artwork not found', status: :not_found
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])

        if artwork && artwork.destroy
            render json: artwork
        else
            render plain: 'artwork not found', status: :not_found
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
    
end