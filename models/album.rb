require('pg')
require_relative('../db/sql_runner')

class Album

  attr_accessor :album_name, :genre, :customer_id
  attr_reader :id

  def initialize(options)
    @album_name = options['album_name']
    @genre = options['genre']
    @artist_id = options ['artist_id'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO albums
    (
      album_name,
      genre,
      artist_id
    ) VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@album_name, @genre, @artist_id]
    new_album = SqlRunner.run(sql, values)
    @id = new_album[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map {|album| Album.new(album) }
  end

  def artists()
    sql = "SELECT * FROM album WHERE id = $1"
    values = [@artists_id]
    artists = SqlRunner.run(sql, values)
    return artists.map {|artist| Artist.new(artist)}
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    deleted_albums = SqlRunner.run(sql)
  end

  def artists()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artists = SqlRunner.run(sql, values)
    return artists.map{|artist| Artist.new(artist)}
  end


end
