require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do 
      erb :root
    end 

    get '/new' do 
      erb :"pirates/new"
    end 

    post '/pirates' do 
      @name = params[:pirate][:name]
      @weight = params[:pirate][:weight]
      @height = params[:pirate][:height]
      # binding.pry
      @pirate = Pirate.new(@name, @weight, @height)
      # binding.pry
      params[:pirate][:ships].each do |stats|
        Ship.new(stats)
      end 

      @ships = Ship.all
      # binding.pry
      erb :"pirates/show"
      
    end 
  end
end
