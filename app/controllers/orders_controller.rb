class OrdersController < Sinatra::Base
  set :views, 'app/views/orders'
  set :method_override, true
  
  get '/orders' do
    @orders = Order.all
    erb :index
  end

  get '/orders/new' do
    erb :new
  end

  post '/orders' do
    @order = Order.create(shopper_id: params[shopper_id], item_id: params[item_id])
    @order.update(:price => params[:price])
    redirect to "/orders/#{@order.id}"
  end

  get '/orders/:id' do
    @order = Order.find(params[:id])
    erb :show
  end

  get '/orders/:id/edit' do
    @order = Order.find(params[:id])
    erb :show
  end

  post '/orders/:id' do
    @order = Order.find(params[:id])
    @order.update(:quantity => params[:quantity])
    redirect "/orders/#{@order.id}"
  end

  delete '/orders/:id' do
    @order = Order.find(params[:id])
    @order.destroy
    redirect "/orders"
  end
end
