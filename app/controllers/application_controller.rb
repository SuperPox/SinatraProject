
class ApplicationController < Sinatra::Base

  configure do
    set(:views, 'app/views')
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, 'secret'
  end

  register Sinatra::Flash

  get('/') do
    @name = "Bob"
    # binding.pry
    erb :home
  end

  helpers do

    def current_user
      @user = User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
        redirect '/login' unless current_user
    end

    def check_owner(obj)
      obj && obj.user == current_user
    end

    def redirect_if_not_owner(obj)
      if !check_owner(obj)
        flash[:message] = "Homie don't play that!"
        redirect '/items'
      end
    end

    def set_item
      @item = Item.find_by(id: params[:id])
    end

  end


end