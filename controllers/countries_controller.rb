require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city.rb' )
also_reload( '../models/*' )


get '/countries' do
  @countries = Country.all()
  erb(:'countries/index')
end

get '/countries/new' do
  erb(:'countries/new')
end

post '/countries' do
  country = Country.new(params)
  country.save
  redirect to('/countries')
end

get '/countries/:id' do
  @country = Country.find(params[:id])
  erb(:'country/show')
end
