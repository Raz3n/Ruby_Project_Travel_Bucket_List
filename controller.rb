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

get '/visit/list' do #index
  @cities = City.all
  erb(:index)
end

get '/visit/all_visits' do
   @visits = Visit.all
   erb(:trips)
 end

get '/visit/new' do #new
  @countries = Country.all
  erb(:new)
end

post '/visit' do
  city = City.new(params)
  city.save
  options = {'country_id' =>params['country_id'], 'city_id'=>city.id, 'visited'=> False}
  visit = Visit.new(options)
  visit.save
  redirect to '/visit/all_visits'
end


get '/visit/:id' do #show
  @city = City.find(params[:id])
  erb(:show)
end

post '/visit' do #create
  @city = City.new(params)
  @city.save
  erb(:show)
end
