require('pg')
require_relative('../db/sql_runner')

class Album

  attr_accessor :title, :genre
  attr_reader :id, :artist_id

  def initialize(params)
    @title=params["title"]
    @genre=params["genre"]
    @id=params["id"].to_i if params["id"]
    @artist_id=params["artist_id"].to_i
  end

  def save
    sql="INSERT INTO albums (title,genre,artist_id)
    VALUES
    ('#{@title}','#{@genre}',#{@artist_id}) RETURNING *;"
    id_finder=SqlRunner.run(sql)
    @id=id_finder[0]['id'].to_i
  end

  def self.all
    sql="SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map{|hash| Album.new(hash)}
  end

  def artists()
    sql = "SELECT * FROM artists WHERE id=#{@artist_id};"
    result = SqlRunner.run(sql)
    artist = Artist.new(result[0])
    return artist
  end

end