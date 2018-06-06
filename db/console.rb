require('pry')
require_relative('../models/album')
require_relative('../models/artist')
require_relative('../db/sql_runner')

# Album.delete_all()
# Artist.delete_all()

artist1 = Artist.new({
  'artist_name' => 'The Beatles'
  })
artist1.save()

album1 = Album.new({
  'album_name' => 'The White Album',
  'genre' => 'Pop',
  'artist_id' => artist1.id()
  })
# album1.save()


binding.pry
nil
