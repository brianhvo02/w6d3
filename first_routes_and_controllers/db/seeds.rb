# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(username: "rvamshi");
User.create!(username: "vbrian");
User.create!(username: "edarren");

Artwork.create!(title: "Mona Lisa", image_url: "https://www.google1.com", artist_id: 1);
Artwork.create!(title: "Starry Night", image_url: "https://www.google2.com", artist_id: 2);
Artwork.create!(title: "The Scream", image_url: "https://www.google3.com", artist_id: 3);

ArtworkShare.create!(artwork_id: 1, viewer_id: 2);
ArtworkShare.create!(artwork_id: 2, viewer_id: 3);
ArtworkShare.create!(artwork_id: 3, viewer_id: 1);
