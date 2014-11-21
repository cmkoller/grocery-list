require 'sinatra'

def get_list
  File.read("grocery_list.txt").split("\n")
end

get '/' do
  redirect '/groceries'
end


get '/groceries' do
  @list = get_list
  erb :groceries
end

post '/groceries' do
  item = params['new_item']

  File.open('grocery_list.txt', 'a') do |file|
    file.puts(item)
  end

  redirect '/groceries'
end
