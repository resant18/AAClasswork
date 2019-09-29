# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  
  Comment.destroy_all
  ArtworkShare.destroy_all
  Artwork.destroy_all
  User.destroy_all
  

  #Users

  phil = User.create!(username: 'Phil')
  renata = User.create!(username: 'Renata')
  dog = User.create!(username: 'Lucky')
  cat = User.create!(username: 'Batman')
  xavier = User.create!(username: 'Xavier')

  #Artworks

  art1 = Artwork.create!(title: "Artistruism", image_url: "thisisagreatURL", artist_id: phil.id)
  art2 = Artwork.create!(title: "Woman From Paiting", image_url: "thisisabetterURL", artist_id: renata.id)
  art3 = Artwork.create!(title: "Doggy Likes to Sit", image_url: "thisisaURL", artist_id: dog.id)
  art4 = Artwork.create!(title: "Cat Likes to Scratch", image_url: "thisisaURL", artist_id: cat.id)
  art5 = Artwork.create!(title: "I like to Play Minecraft", image_url: "thisisaURL", artist_id: xavier.id)

  #ArtworkShares
  art_shares1 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: cat.id)
  art_shares2 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: dog.id)
  art_shares3 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: renata.id)
  art_shares4 = ArtworkShare.create!(artwork_id: art2.id, viewer_id: xavier.id)
  art_shares5 = ArtworkShare.create!(artwork_id: art5.id, viewer_id: renata.id)

  #comments
  cmment1 = Comment.create!(author_id: renata.id, artwork_id: art1.id, body: "What's that Artistruism")
  cmment2 = Comment.create!(author_id: phil.id, artwork_id: art2.id, body: "WONDERFUL")
  cmment3 = Comment.create!(author_id: phil.id, artwork_id: art2.id, body: "THIS IS THE BEST")
  cmment4 = Comment.create!(author_id: dog.id, artwork_id: art2.id, body: "WOOF WOOF WOOF")
  cmment5 = Comment.create!(author_id: xavier.id, artwork_id: art2.id, body: "I like painting")

  
end


