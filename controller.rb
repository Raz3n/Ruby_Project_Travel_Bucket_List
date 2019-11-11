require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/country')
require_relative('./models/city')
require_relative('./models/visit')
also_reload('./models/*')

# HOME route

get '/' do
  erb(:home)
end

get '/visit/list' do
  @cities = City.all
  erb(:index)
end

get '/visit/new' do
  @countries = Country.all
  erb(:new)
end

get '/visit/:id' do
   @city = City.find(params[:id])
   erb(:show)
 end
