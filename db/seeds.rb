require_relative('../models/country.rb')
require_relative('../models/city.rb')
require('pry-byebug')

Country.delete_all()
City.delete_all()

country1 = Country.new({'name' => 'Ireland'})
country2 = Country.new({'name' => 'Tanzania'})
country3 = Country.new({'name' => 'Italy'})
country4 = Country.new({'name' => 'Portugal'})
country5 = Country.new({'name' => 'Brazil'})
country6 = Country.new({'name' => 'Canada'})

country1.save()
country2.save()
country3.save()
country4.save()
country5.save()
country6.save()

city1 = City.new({'country_id' => country1.id, 'name' => 'Dublin', 'visited' => true})
city2 = City.new({'country_id' => country2.id, 'name' => 'Zanzibar', 'visited' => true})
city3 = City.new({'country_id' => country3.id, 'name' => 'Rome', 'visited' => false})
city4 = City.new({'country_id' => country4.id, 'name' => 'Lisbon', 'visited' => true})
city5 = City.new({'country_id' => country5.id, 'name' => 'Rio De Janeiro', 'visited' => false})
city6 = City.new({'country_id' => country5.id, 'name' => 'Sao Paulo', 'visited' => true})
city7 = City.new({'country_id' => country6.id, 'name' => 'Toronto', 'visited' => true})

city1.save()
city2.save()
city3.save()
city4.save()
city5.save()
city6.save()
city7.save()


nil
