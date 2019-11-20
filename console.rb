require('pry')
require_relative('models/album')
require_relative('models/artist')


  artist1 = Artist.new({
  'name' => 'Jim Morrison'

  })
  artist1.save()

  artist2 = Artist.new({
  'name' => 'The Boss'

  })
  artist2.save()

  artist3 = Artist.new({
  'name' => 'Tom Waits'

  })
  artist3.save()

  album1 = Album.new({
    'title' => "LA Woman",
    'genre' => "Rock",
    'artist_id' => artist1.id

    })
    album1.save()

    album2 = Album.new({
      'title' => "Nebraska",
      'genre' => "Rock",
      'artist_id' => artist2.id

      })
      album2.save()

      album3 = Album.new({
        'title' => "The Rising",
        'genre' => "Rock",
        'artist_id' => artist2.id

        })
        album3.save()

        album4 = Album.new({
          'title' => "Closing Time",
          'genre' => "Rock",
          'artist_id' => artist3.id

          })
          album4.save()

  binding.pry()

nil
