require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/country')
require_relative('./models/city')
require_relative('./models/visit')
also_reload('./models/*')

# HOME route

get '/' do
  @cities = City.all
  erb(:index)
end
