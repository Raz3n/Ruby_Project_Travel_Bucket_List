require_relative('../db/sql_runner')
require_relative('./country.rb')

class City

  attr_reader :id
  attr_accessor :country_id, :name, :visited

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @country_id = options['country_id'].to_i
    @name = options['name']
    @visited = options['visited']
  end

  def save()
    sql = "INSERT INTO cities (country_id, name, visited)
    VALUES($1, $2, $3)
    RETURNING id;"   #does order matter in save? can't remember
    values = [@country_id, @name, @visited]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def country()
    country = Country.find(@country_id)
    return country
  end

  def country_name
    sql = "SELECT * FROM countries WHERE id = $1"
    values = [@country_id]
    result = SqlRunner.run(sql, values)
    return Country.new(result.first)
  end

  def update()
    sql = "UPDATE cities
    SET (country_id, name, visited) = ($1, $2, $3)
    WHERE id = $4;"
    values = [@country_id, @name, @visited, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM cities WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM cities;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM cities;"
    city_info = SqlRunner.run(sql)
    result = map_items(city_info)
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM cities WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    city = City.new(result)
    return city
  end

  def self.map_items(city_info)
    return city_info.map {|city| City.new(city)}
  end

  def visit
   if @visited == 'true'
     return "Visited"
   else
     return "Not Visited"
   end
 end

  def self.visited
    sql = 'SELECT * FROM cities WHERE visited = $1'
    values = [true]
    results = SqlRunner.run(sql, values)
    return results.map {|city| City.new(city)}
  end

  def self.not_visited
    sql = 'SELECT * FROM cities WHERE visited = $1'
    values = [false]
    results = SqlRunner.run(sql, values)
    return results.map {|city| City.new(city)}
  end

end
