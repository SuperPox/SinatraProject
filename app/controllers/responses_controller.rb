class ResponsesController < ApplicationController

    get '/items' do
  
      # @items = ["Sugar", "Salt", "Flour"]
      @items = Item.all
      erb :'items/index'
    end
  
    get '/items/new' do
      erb :'items/new'
    end
  
    post '/items' do
      item = Item.create(params[:item])
      # erb :'items/show'
      redirect "items/#{item.id}"
    end
  
  
    get '/items/:id' do
      # items = [Item.new(name: "Sugar", id: 1, quantity: "1 Cup"), Item.new(name: "Salt", id: 2, quantity: "1 Cup"), Item.new(name: "Flour", id: 3, quantity: "1 Cup")]
      # @item = items.find {|i| i.id. == self.params[:id].to_i}
      @item = Item.find_by(id: params[:id])
      if !@item
        redirect '/items'
      end
      erb :'items/show'
    end
  
  
    get '/items/:id/edit' do
      @item = Item.find_by(id: params[:id])
      if !@item
        redirect '/items'
      end
      erb :'items/edit'
    end
  
    patch '/items/:id' do
      @item = Item.find_by(id: params[:id])
      @item.update(params[:item])
      erb :'items/show'
    end
  
    delete '/items/:id' do
      item = Item.find_by(id: params[:id])
      item.delete
      # @items = Item.all
      # erb :'items/index'
      redirect('/items')
    end
  
  
  end