require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/visit.rb')
require('pry-byebug')

Country.delete_all()
City.delete_all()
Visit.delete_all()

country1 = Country.new({'name' => 'Ireland'})
country2 = Country.new({'name' => 'Tanzania'})
country3 = Country.new({'name' => 'Italy'})
country4 = Country.new({'name' => 'Portugal'})
country5 = Country.new({'name' => 'Brazil'})

country1.save()
country2.save()
country3.save()
country4.save()
country5.save()

city1 = City.new({'country_id' => country1.id, 'name' => 'Dublin'})
city2 = City.new({'country_id' => country2.id, 'name' => 'Zanzibar'})
city3 = City.new({'country_id' => country3.id, 'name' => 'Rome'})
city4 = City.new({'country_id' => country4.id, 'name' => 'Lisbon'})
city5 = City.new({'country_id' => country5.id, 'name' => 'Rio De Janeiro'})
city6 = City.new({'country_id' => country5.id, 'name' => 'Sao Paulo'})

city1.save()
city2.save()
city3.save()
city4.save()
city5.save()
city6.save()

visit1 = Visit.new({'country_id' => country1.id, 'city_id' => city1.id, 'visited' => 'visited'})
visit2 = Visit.new({'country_id' => country2.id, 'city_id' => city2.id, 'visited' => 'Not visited'})
visit3 = Visit.new({'country_id' => country3.id, 'city_id' => city3.id, 'visited' => 'visited'})
visit4 = Visit.new({'country_id' => country5.id, 'city_id' => city5.id, 'visited' => 'visited'})
visit5 = Visit.new({'country_id' => country5.id, 'city_id' => city6.id, 'visited' => 'Not visited'})


visit1.save()
visit2.save()
visit3.save()
visit4.save()
visit5.save()







binding.pry
nil
