get '/' do
  @uploads = Upload.all

  erb :'uploads/index'
end

get '/uploads/new' do
  erb :'uploads/new'
end

post '/uploads' do
   @upload = Upload.create(link: params[:link], description: params[:description])
  if @upload.save
    @uploads = Upload.all
    redirect '/'
  else
    @errors = @uploads.errors.full_messages
    erb :'uploads/new'
  end

end

get '/uploads/:id' do

end
