class ApplicationController < Sinatra::Base

    configure do
      set(:views, 'app/views')
      set :public_folder, 'public'
      enable :sessions
      set :session_secret, 'secret'
    end
  
    get('/') do
      @name = "Bob"
      # binding.pry
      erb :home
    end
  
  
end