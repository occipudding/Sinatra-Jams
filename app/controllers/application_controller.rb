require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get "/index" do
    @artists = Artist.all
    erb :index
  end

  get "/artist/new" do
    erb :new_artist
  end

  get "/artist/:id" do
    @artist = Artist.find_by(id: params[:id])
    erb :show
  end

  post "/index" do
    @artist = Artist.create(params)
    redirect to "/artist/#{@artist.id}"
  end

end
