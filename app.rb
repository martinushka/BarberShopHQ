#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'rake'

set :database, { adapter: 'sqlite3', database: 'barbershop.db' }

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all # запрос к БД
end

get '/' do
	erb :index
end

get '/contacts' do
	erb :contacts
end

get '/visit' do
	erb :visit
end

post '/visit' do

	@username = params[:username]
	@phone 	  = params[:phone]
	@datetime = params[:datetime]
	@barber   = params[:barber]
	@color 	  = params[:color]

	# name, phone, datestamp, barber, color

	c = Client.new
	c.name 		= @username
	c.phone 	= @phone
	c.datestamp = @datetime
	c.barber 	= @barber
	c.color 	= @color
	c.save

	erb "<h2>Спасибо, вы записались!</h2>"

end