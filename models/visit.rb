require_relative('../db/sql_runner')
require_relative('./country.rb')
require_relative('./city.rb')

class Visit

  attr_reader :id
  attr_accessor :country_id, :city_id, :visited

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @country_id = options['country_id'].to_i
    @city_id = options['city_id'].to_i
    @visited = options['visited']
  end

  def save()
    sql = "INSERT INTO visits (country_id, city_id, visited)
    VALUES ($1, $2, $3)
    RETURNING id;"
    values = [@country_id, @city_id, @visited]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def city()
    city = City.find(@city_id)
    return city
  end

  def country()
    country = Country.find(@country_id)
    return country
  end

  def update()
    sql = "UPDATE visits
    SET (country_id, city_id, visited)
    = ($1, $2, $3)
    WHERE id = $4;"
    values = [@country_id, @city_id, @visited, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM visits WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM visits;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM visits;"
    visit = SqlRunner.run(sql)
    result = map_items(visit_info)
    return result
  end

  def self.map_items(visit_info)
    return visit_info.map {|visit| Visit.new(visit)}
  end

  def self.find(id)
    sql = "SELECT * FROM visits WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    visit = Visit.new(result)
    return visit
  end

  # def city()
  #   city = City.find(@city_id)
  #   return city
  # end
  #
  # def country()
  #   country = Country.find(@country_id)
  #   return country
  # end

  def find_city()
    sql = "SELECT FROM city WHERE id = $1"
    values = [@city_id]
    city = SqlRunner.run(sql, values)
    result = City.new(city.first)
    return result
  end

  def find_country()
    sql = "SELECT FROM country WHERE id = $1"
    values = [@country_id]
    country = SqlRunner.run(sql, values)
    result = Country.new(country.first)
    return result
  end

end
