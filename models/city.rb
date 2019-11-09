require_relative('../db/sql_runner')
require_relative('./country')

class City

  attr_reader :id
  attr_accessor :name, :country_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country_id = options['country_id'].to_i

    


end
