require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/country')
require_relative('./models/city')
require_relative('./models/visit')
also_reload('./models/*')

# HOME route
get '/visits' do
  @cities = City.all
  erb(:index)
end

get '/visits/new' do
  @countries = Country.all
  erb(:new)
end

post '/visits' do
  City.new(params).save
  redirect to '/visits'
end
