class Artwork < ApplicationRecord 

    validates :image_url, presence: true, uniqueness: true 
    validates :title, uniqueness: {scope: :artist_id}

    belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User 

    has_many :shared_viewers,
    through: :artwork_share,
    source: :viewer

    has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy
end 