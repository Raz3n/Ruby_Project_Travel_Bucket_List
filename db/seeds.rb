require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/visit.rb')
require('pry-byebug')

Country.delete_all()

country1 = Country.new({'name' => 'Ireland'})

country1.save()










binding.pry
nil
