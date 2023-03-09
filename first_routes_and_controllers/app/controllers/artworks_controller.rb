class ArtworksController < ApplicationController
    def index
        render json: Artwork.all
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