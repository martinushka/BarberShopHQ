#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'rake'

set :database, { adapter: 'sqlite3', database: 'barbershop.db' }

class Client < ActiveRecord::Base
	validates :name, presence: true 
	validates :phone, presence: true 
	validates :datestamp, presence: true
	validates :color, presence: true

  # функция    пар1     пар2(хеш)
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

	c = Client.new params[:client]
	c.save

	erb "<h2>Спасибо, вы записались!</h2>"

end