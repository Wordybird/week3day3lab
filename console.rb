require ('pry-byebug')
require_relative('models/albums')
require_relative('models/artists')

artist1=Artist.new({"name"=>"David Bowie"})
artist1.save()

album1=Album.new({'title'=>'Heroes','genre'=>'rock','artist_id'=>artist1.id})
album1.save()
album2=Album.new({'title'=>'Black Star','genre'=>'rock','artist_id'=>artist1.id})
album2.save()

Artist.all()
Album.all()

binding.pry

nil