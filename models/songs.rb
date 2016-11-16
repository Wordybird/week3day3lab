require('pg')
require_relative('../db/sql_runner')

class Song

  attr_accessor :name
  attr_reader :id, :album_id

  def initialize(params)
    @name=params["name"]
    @id=params["id"].to_i if params["id"]
    @album_id=params["album_id"].to_i
  end
  
  def save
    sql="INSERT INTO songs (name)
    VALUES
    ('#{@name}') RETURNING *;"
    id_finder=SqlRunner.run(sql)
    @id=id_finder[0]['id'].to_i
  end

  def self.all
    sql="SELECT * FROM songs;"
    songs = SqlRunner.run(sql)
    return songs.map{|hash| Song.new(hash)}
  end

  def album()
     sql = "SELECT * FROM albums WHERE id=#{@album_id};"
     result = SqlRunner.run(sql)
     album = Album.new(result[0])
     return album
  end

  def self.delete_all
    sql="DELETE FROM songs;"
    SqlRunner.run(sql)
  end

  def delete
    return unless @id
    sql="DELETE FROM songs WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def update
    sql="UPDATE songs SET
    (name) = ('#{@name}') WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

  def find_by_id
    sql = "SELECT * FROM songs WHERE id=#{@id};"
    result = SqlRunner.run(sql)
    return result[0]
  end

end