require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/visit.rb')
require('pry-byebug')

Country.delete_all()

country1 = Country.new({'name' => 'Ireland'})
country2 = Country.new({'name' => 'Tanzania'})

country1.save()
country2.save()

city1 = City.new({'country_id' => country1.id, 'name' => 'Dublin'})
city2 = City.new({'country_id' => country2.id, 'name' => 'Zanzibar'})

city1.save()
city2.save()








binding.pry
nil
