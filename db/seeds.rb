# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# me = User.create({email: "chrisb", password: "chrisb"})
me = User.find(1)


# User.create([
#   {email: "picasso", password: "picasso"},
#   {email: "lewitt", password: "lewitt"},
#   {email: "duschamp", password: "duschamp"}])
#
# picasso = Artist.create(name: 'Pablo Picasso')
# duschamp = Artist.create(name: 'Marcel Duschamp')
# johns = Artist.create(name: 'Jasper Johns')
# lewitt = Artist.create(name: 'Sol Lewitt')

picasso = Artist.find_by(name: 'Pablo Picasso')
duschamp = Artist.find_by(name: 'Marcel Duschamp')
johns = Artist.find_by(name: 'Jasper Johns')
lewitt = Artist.find_by(name: 'Sol Lewitt')

Artwork.create([
  {image: 'http://erikaunapuu.files.wordpress.com/2013/05/picasso-girl-before-a-mirror.jpeg', uploader: me, artist: picasso, title: 'Girl Before a Mirror', art_type: 'painting'},
  {image: 'http://cp91279.biography.com/1000509261001/1000509261001_1910637818001_TDIH-Picasso-Guernica.jpg', uploader: me, artist: picasso, title: 'Guernica', art_type: 'painting'},
  {image: 'http://upload.wikimedia.org/wikipedia/commons/c/ce/Marcel_Duchamp.jpg', uploader: me, artist: duschamp, title: 'Fountain', art_type: 'sculpture'},
  {image: 'http://upload.wikimedia.org/wikipedia/en/c/c0/Duchamp_-_Nude_Descending_a_Staircase.jpg', uploader: me, artist: duschamp, title: 'Nude Descending a Staircase', art_type: 'painting'},
  {image: 'http://www.moma.org/collection_images/resized/377/w500h420/CRI_136377.jpg', uploader: me, artist: johns, title: 'Flag', art_type: 'painting'},
  {image: 'http://www.tate.org.uk/art/images/work/T/T00/T00454_10.jpg', uploader: me, artist: johns, title: '0-9', art_type: 'painting'},
  {image: 'http://www.blackbird.vcu.edu/v7n1/gallery/ravenal_j/images/lewitt17.jpg', uploader: me, artist: lewitt, title: 'Splotch #22', art_type: 'sculpture'},
  {image: 'http://thenevicaproject.org/Gallery%20Artist/popups/lewitt_distorted_cubes.jpg', uploader: me, artist: lewitt, title: 'Distorted Cubes', art_type: 'painting'}
])
