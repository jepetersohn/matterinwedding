get '/' do
  @uploads = Upload.all

  erb :'uploads/index'
end

get 'uploads/new' do

end

post '/uploads' do

end

get '/uploads/:id' do

end
