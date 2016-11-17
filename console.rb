require ("pry-byebug")
require_relative("models/albums")
require_relative("models/artists")
require_relative("models/songs")

Song.delete_all
Album.delete_all
Artist.delete_all

artist1=Artist.new({"name"=>"David Bowie"})
artist1.save()
artist2=Artist.new({"name"=>"Lid Zeppelin"})
artist2.save()
artist3=Artist.new({"name"=>"Saxon"})
artist3.save()

artist3.delete()

album1=Album.new({"title"=>"Heroes","genre"=>"rock","artist_id"=>artist1.id})
album1.save()
album2=Album.new({"title"=>"Black Star","genre"=>"rock","artist_id"=>artist1.id})
album2.save()

album3=Album.new({"title"=>"Led Zeppelin 2","genre"=>"rock","artist_id"=>artist2.id})
album3.save()
album4=Album.new({"title"=>"Physical Graffiti","genre"=>"rock","artist_id"=>artist2.id})
album4.save()
album5=Album.new({"title"=>"Houses of the Unholy","genre"=>"rock","artist_id"=>artist2.id})
album5.save()

song1=Song.new({"name"=>"Custard Pie","album_id"=>album4.id})
song1.save
song2=Song.new({"name"=>"The Rover","album_id"=>album4.id})
song2.save
song3=Song.new({"name"=>"In My Time Of Dying","album_id"=>album4.id})
song3.save
song4=Song.new({"name"=>"Houses Of The Holy","album_id"=>album4.id})
song4.save
song5=Song.new({"name"=>"Trampled Under Foot","album_id"=>album4.id})
song5.save
song6=Song.new({"name"=>"Kashmir","album_id"=>album4.id})
song6.save
song7=Song.new({"name"=>"In The Light","album_id"=>album4.id})
song7.save
song8=Song.new({"name"=>"Bron-Yr Aur","album_id"=>album4.id})
song8.save

artist2.name="Led Zeppelin"
artist2.update

album5.title="Houses Of The Holy"
album5.update

Artist.all()
Album.all()
Song.all()

binding.pry

nil