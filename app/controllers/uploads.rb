get '/' do
  @uploads = Upload.all

  erb :'uploads/index'
end

get 'uploads/new' do
  erb :'uploads/new'
end

post '/uploads' do

end

get '/uploads/:id' do

end
