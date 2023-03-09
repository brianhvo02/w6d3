class User < ApplicationRecord 
    validates :username, presence: true, uniqueness: true 


    has_many :artworks,
    class_name: :Artwork,
    foreign_key: :artist_id

    has_many :shared_artworks,
    through: :artwork_share,
    source: :artwork 
end