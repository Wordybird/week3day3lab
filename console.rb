require ('pry-byebug')
require_relative('models/albums')
require_relative('models/artists')

Album.delete_all
Artist.delete_all

artist1=Artist.new({"name"=>"David Bowie"})
artist1.save()
artist2=Artist.new({"name"=>"Led Zeppelin"})
artist2.save()
# artist3=Artist.new({"name"=>"Saxon"})
# artist3.save()

# artist3.delete()

album1=Album.new({'title'=>'Heroes','genre'=>'rock','artist_id'=>artist1.id})
album1.save()
album2=Album.new({'title'=>'Black Star','genre'=>'rock','artist_id'=>artist1.id})
album2.save()
album3=Album.new({'title'=>'Led Zeppelin 2','genre'=>'rock','artist_id'=>artist2.id})
album3.save()
album4=Album.new({'title'=>'Physical Graphs','genre'=>'rock','artist_id'=>artist2.id})
album4.save()
album5=Album.new({'title'=>'Houses of the Holy','genre'=>'rock','artist_id'=>artist2.id})
album5.save()

album4.title='Physical Graffitti'
album4.update

Artist.all()
Album.all()

binding.pry

nil