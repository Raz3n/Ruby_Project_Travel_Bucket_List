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
    RETURNING id;"   #does order matter in save? I think so?
    values = [@country_id, @name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE cities
    SET (country_id, name) = ($1, $2)
    WHERE id = $3;"   #Will this update country table as well? do I need/ can I delete update in country.rb?
    values = [@country_id, @name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM cities WHERE id = $1;"
    values = [@id]   # same as above country should be deleted beacuse of on delete cascade?
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM cities;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM cities"
    city = SqlRunner.run(sql)
    result = city.map
  end



end
