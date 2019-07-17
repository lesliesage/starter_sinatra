class ShoppersController < Sinatra::Base
  set :views, 'app/views/shoppers'
  set :method_override, true

  get '/shoppers' do
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
    @items = Item.all
    @items_hash = {}
    Item.all.each do |item|
      @items_hash[item.name] = 0
    end
    @shopper.orders.each do |order|
      @items_hash[order.item.name] = order.quantity
    end
    erb :show
  end

  post '/orders' do
    @order = Order.find_or_create_by(shopper_id: params[], order_id: params[])
  end

  get '/shoppers/:id/confirmation' do
    @shopper = Shopper.find(params[:id])
    @items = Item.all
    @items_hash = {}
    Item.all.each do |item|
      @items_hash[item.name] = 0
    end
    @shopper.orders.each do |order|
      @items_hash[order.item.name] = order.quantity
    end
    erb :confirmation
  end

  get '/shoppers/:id/edit' do
    @shopper = Shopper.find(params[:id])
    erb :edit
  end

  patch '/shoppers/:id' do
    @shopper = Shopper.find(params[:id])
    @shopper.update(name: params[:name])
    redirect "/shoppers/#{@shopper.id}"
  end

  delete '/shoppers/:id' do
    @shopper = Shopper.find(params[:id])
    @shopper.destroy
    redirect "/shoppers"
  end
end
