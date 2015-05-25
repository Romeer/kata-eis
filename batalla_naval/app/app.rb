require_relative 'model/board'

module Battleship
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

    enable :sessions

    #get '/' do
      #File.read(File.join('public', 'index.html'))
    #end

    get 'battleship' do
      render 'batalla/inicio'
    end

    post 'new_board' do
      session[:board] = Board.new(params[:width].to_i,params[:height].to_i)
      render 'batalla/inicio'
    end

    post 'small_ship' do
      board = session[:board]
      begin
        board.create_small_ship(params[:x_coord_small].to_i,params[:y_coord_small].to_i)
      rescue Exception => e
        @small_ship_error = e.message
      end
      render 'batalla/inicio'
    end

    post 'large_ship' do
      board = session[:board]
      begin
        board.create_large_ship(params[:x_coord_large].to_i,params[:y_coord_large].to_i)
      rescue Exception => e
        @large_ship_error = e.message
      end
      render 'batalla/inicio'
    end

    post 'shoot' do
      board = session[:board]
      @shoot_result = board.shoot(params[:shoot_x].to_i,params[:shoot_y].to_i)
      render 'batalla/inicio'
    end

    get 'is_occupied' do
      board = session[:board]
      @nombre = board.is_occupied?(params[:x_coord].to_i,params[:y_coord].to_i).to_s
      render 'batalla/inicio'
    end
  end
end
