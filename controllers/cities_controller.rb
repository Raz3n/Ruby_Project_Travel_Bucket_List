require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/city.rb')
require_relative('../models/country.rb')
also_reload('./models/*')

get '/cities' do
  @cities = City.all()
  erb(:'cities/index')
end

post '/cities' do
  city = City.new(params)
  city.save
  redirect to('/cities')
end

get '/cities/visited' do
  @visited_cities = City.visited
  erb(:'cities/visited')
end

get '/cities/notvisited' do
  @visited_cities = City.not_visited
  erb(:'cities/visited')
end

get '/cities/new' do
  @countries = Country.all
  erb(:'cities/new')
end

get '/cities/:id' do
  @city = City.find(params[:id])
  erb(:'cities/show')
end

get '/cities/:id/edit' do
  @city = City.find(params[:id])
  @countries = Country.all
  erb(:'cities/edit')
end

post '/cities/:id' do
  city = City.new(params)
  city.update
  redirect to "/cities/#{params["id"]}"
end

post '/cities/:id/delete' do
  city = City.find(params[:id])
  city.delete()
  redirect to '/cities'
end
