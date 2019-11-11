require_relative('../db/sql_runner')
require_relative('./country.rb')

class City

  attr_reader :id
  attr_accessor :country_id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @country_id = options['country_id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO cities (country_id, name)
    VALUES($1, $2)
    RETURNING id;"   #does order matter in save? can't remember
    values = [@country_id, @name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE cities
    SET (country_id, name) = ($1, $2)
    WHERE id = $3;"
    values = [@country_id, @name, @id]
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
    city = SqlRunner.run(sql)
    result = city.map
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

  def country()
    country = Country.find(@country_id)
    return country
  end #should now be able to get the country info



end
