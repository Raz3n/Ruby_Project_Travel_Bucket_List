require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city.rb' )
also_reload( '../models/*' )


get '/countries' do
  @countries = Country.all()
  erb(:'countries/index')
end

get "/countries/:id" do
  @countries = Country.find(params[:id])
  erb(:'country/show')
end

get "/countries/new" do
  @countries = Country.all()
  erb(:'countries/new')
end
