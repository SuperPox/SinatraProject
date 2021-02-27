class UsersController < ApplicationController

  get '/signup' do
    if session[:user_id]
      redirect "/users/#{session[:user_id]}"
    end
    erb :'users/signup'
  end

  post '/signup' do
    u = User.create(params[:user])
    if u.id
      session[:user_id] = u.id
      redirect "/users/#{u.id}"
    else
      @errors = u.errors.full_messages
      erb :'/users/signup'
    end
  end

  get '/users/:id' do
    redirect_if_not_logged_in
      @user = User.find_by(id: params[:id])
      @items = @user.items
      erb :'users/show'
  end

  get '/login' do
    if session[:user_id]
      redirect "/users/#{session[:user_id]}"
    end
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:message] = "login successful!"
      redirect "/users/#{user.id}"
    else
      @errors = ["Invalid Login"]
      erb :'users/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  get '/users' do
    redirect_if_not_logged_in
    @users = User.all
    erb :'users/index'

  end


end