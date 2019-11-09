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

  def country()
    country = Country.find(@country_id)
    return country
  end

  def find_country_name
    sql = "SELECT * FROM countries WHERE country.id = $1"
    values = [@country_id]
    result = SqlRunner.run(sql, values)
    return Country.new(result.first)
  end





end
