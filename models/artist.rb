require_relative('../db/sql_runner')
require_relative('album')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']

  end

  def save()
    sql = "INSERT INTO artist(name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()


  end

  def  Artist.all()
    sql = "SELECT * FROM artist;"
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end

#will fix code for artist_for_album in the morning, not right
  def artist_for_album()
    sql = "SELECT * FROM album WHERE id = $1"
    values = [@id]
    album = SqlRunner.run(sql, values)[0]
    return Album.new(album)


  end


  def delete()
    sql = "DELETE FROM artist WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)

  end

  def update()
    sql = "UPDATE artist SET(name) = ($1)
    WHERE id = $2"
    values = [@name]
    SqlRunner.run(sql, values)

  end

end
