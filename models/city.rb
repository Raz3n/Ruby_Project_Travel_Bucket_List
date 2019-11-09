require_relative('../db/sql_runner')
require_relative('./country')

class City

  attr_reader :id
  attr_accessor :name, :country_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country_id = options['country_id'].to_i

  def save()
    sql = "INSERT INTO cities (name, country_id)
    VALUES($1, $2)
    RETURNING id;"   #does order matter in save? I think so?
    values = [@name, @country_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end



end
