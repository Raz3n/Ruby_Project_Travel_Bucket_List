require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city.rb' )
also_reload( '../models/*' )

get '/countries' do
  @countries = Country.all()
  erb(:'countries/index')
end

post '/countries' do
  country = Country.new(params)
  country.save
  redirect to('/countries')
end

get '/countries/new' do
  erb(:'countries/new')
end

get "/countries/:id/edit" do
  @country = Country.find(params[:id])

  erb(:'countries/edit')
end

post '/countries/:id' do
  country = Country.new(params)
  country.update
  redirect to "/countries/#{params["id"]}"
end

get '/countries/:id' do
  @country = Country.find(params[:id])
  erb(:'countries/show')
end

post "/countries/:id/delete" do
  country = Country.find(params[:id])
  country.delete()
  redirect to '/countries'
end
