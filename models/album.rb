require_relative('../db/sql_runner')
require_relative('artist')


class Album

attr_accessor :title, :genre
attr_reader :id, :artist_id

def initialize(options)
  @id = options['id'].to_i() if options['id']
  @title = options['title']
  @genre = options['genre']
  @artist_id = options['artist_id'].to_i()
end


def save()
  sql = "INSERT INTO album(title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
  values = [@title, @genre, @artist_id]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i()


end

  def  Album.all()

    sql = "SELECT * FROM album;"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}

  end

  def artist()
    sql = "SELECT * FROM artist WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run(sql, values)[0]
    return Artist.new(artist)


  end

  def delete()

    sql = "DELETE FROM album WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)

  end

  def update()
    sql = "UPDATE album SET(title, genre) = ($1, $2)
     WHERE id = $3"
     values = [@title, @genre, @id]
     SqlRunner.run(sql, values)

  end















end
