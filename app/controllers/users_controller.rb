class UsersController < ApplicationController

    get '/signup' do
      if session[:user_id]
        redirect "/users/#{session[:user_id]}"
      end
      erb :'users/signup'
    end
  
    post '/users' do
      u = User.create(params[:user])
      session[:user_id] = u.id
      redirect "/users/#{u.id}"
    end
  
    get '/users/:id' do
        @user = User.find_by(id: params[:id])
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
        redirect "/users/#{user.id}"
      else
        erb :'users/login'
      end
    end
  
    get '/logout' do
      session.clear
      redirect '/login'
    end
  
  
  end