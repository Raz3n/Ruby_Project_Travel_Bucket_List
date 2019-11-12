require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/city.rb')
require_relative('../models/country.rb')
also_reload('./models/*')

get '/cities' do
  @cities = City.all()
  erb(:"cities/index")
end

get '/cities/visited' do
  @visited_cities = City.visited
  erb(:"cities/visited")
end

get '/cities/notvisited' do
  @visited_cities = City.not_visited
  erb(:"cities/visited")
end

get "/cities/new" do
  @countries = Country.all
  erb(:'cities/new')
end

get '/cities/:id' do
  @city = City.find(params[:id])
  erb(:'cities/show')
end

get "/cities/:id/edit" do
  @city = City.find(params[:id])
  @countries = Country.all
  erb(:'cities/edit')
end
