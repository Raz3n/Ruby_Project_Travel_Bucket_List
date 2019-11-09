require_relative('../db/sql_runner')

class Country

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO countries (name)
    VALUES($1)
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE countries
    SET (name) = ($1)
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM countries WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


end
