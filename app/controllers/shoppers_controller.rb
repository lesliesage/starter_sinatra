class ShoppersController < Sinatra::Base
  set :views, 'app/views/shoppers'
  set :method_override, true
  
  get '/shopper' do
    @shoppers = Shopper.all
    erb :index
  end

  get '/shoppers/new' do
    erb :new
  end

  post '/shoppers' do
    @shopper = Shopper.find_or_create_by(name: params[:name])
    redirect to "/shoppers/#{@shopper.id}"
  end

  get '/shoppers/:id' do
    @shopper = Shopper.find(params[:id])
    erb :show
  end

  get '/shoppers/:id/edit' do
    @shopper = Shopper.find(params[:id])
    erb :show
  end

  post '/shoppers/:id' do
    @shopper = Shopper.find(params[:id])
    @shopper.update(params[:name])
    redirect "/shoppers/#{@shopper.id}"
  end

  delete '/shoppers/:id' do
    @shopper = Shopper.find(params[:id])
    @shopper.destroy
    redirect "/shoppers"
  end
end
