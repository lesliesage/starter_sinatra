class ItemsController < Sinatra::Base
  set :views, 'app/views/items'
  set :method_override, true

  get '/items' do
    @items = Item.all
    erb :index
  end

  get '/items/new' do
    erb :new
  end

  post '/items' do
    @item = Item.find_or_create_by(name: params[:name])
    @item.update(:price => params[:price])
    redirect to "/items/#{@item.id}"
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :show
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    erb :show
  end

  post '/items/:id' do
    @item = Item.find(params[:id])
    @item.update(params[:name], params[:price])
    redirect "/items/#{@item.id}"
  end

  delete '/items/:id' do
    @item = Item.find(params[:id])
    @item.destroy
    redirect "/items"
  end
end
