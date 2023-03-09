class User < ApplicationRecord 
    validates :username, presence: true, uniqueness: true 

    has_many :artworks,
    class_name: :Artwork,
    foreign_key: :artist_id,
    inverse_of: :artist, 
    dependent: :destroy
    

    has_many :artwork_shares,
    class_name: :ArtworkShare,
    foreign_key: :viewer_id,
    dependent: :destroy

    has_many :shared_artworks,
    through: :artwork_share,
    source: :artwork 

    has_many :comments,
    foreign_key: :author_id,
    class_name: :Comment ,
    inverse_of: :author,
    dependent: :destroy
end