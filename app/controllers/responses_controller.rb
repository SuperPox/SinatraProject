class ResponsesController < ApplicationController

  get '/items' do
    redirect_if_not_logged_in
    @items = Item.all
    erb :'items/index'
  end

  get '/items/new' do
    redirect_if_not_logged_in
    erb :'items/new'
  end

  post '/items' do
    redirect_if_not_logged_in
    # option 1
    # item = Item.create(params[:item])
    # user = User.find_by(id: session[:user_id])
    # user.items << item
    # option 2

    item = current_user.items.create(params[:item])
    if item.valid?
      redirect "items/#{item.id}"
    else
        flash[:message] = item.errors.full_messages
        redirect '/items/new'
    end
    # option 3
    # item = Item.create(params[:item])
    # item.user_id = session[:user_id]
    # item.save
    # binding.pry

  end


  get '/items/:id' do
    redirect_if_not_logged_in
    # items = [Item.new(name: "Sugar", id: 1, quantity: "1 Cup"), Item.new(name: "Salt", id: 2, quantity: "1 Cup"), Item.new(name: "Flour", id: 3, quantity: "1 Cup")]
    # @item = items.find {|i| i.id. == self.params[:id].to_i}
    set_item
    if !@item
      redirect '/items'
    end
    erb :'items/show'
  end


  get '/items/:id/edit' do
    redirect_if_not_logged_in
    set_item
    redirect_if_not_owner(@item)
    erb :'items/edit'
  end

  patch '/items/:id' do
    redirect_if_not_logged_in
    set_item
    if check_owner(@item)
      @item.update(params[:item])
    end
    erb :'items/show'
  end

  delete '/items/:id' do
    redirect_if_not_logged_in
    set_item
    if check_owner(@item)
      @item.delete
      redirect('/items')
    else
      # set up error message
      erb :'items/show'
    end
    # @items = Item.all
    # erb :'items/index'

end