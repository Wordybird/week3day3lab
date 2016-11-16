require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(params)
    @name=params["name"]
    @id=params["id"].to_i if params["id"]
  end
  
  def save
    sql="INSERT INTO artists (name)
    VALUES
    ('#{@name}') RETURNING *;"
    id_finder=SqlRunner.run(sql)
    @id=id_finder[0]['id'].to_i
  end

end