get '/' do
  @uploads = Upload.all

  erb :'uploads/index'
end

get '/uploads/new' do
  if request.xhr?
    erb :'partials/_form', layout: false
  end
end

post '/uploads' do
  if request.xhr?
    upload = Upload.create(link: params[:link], description: params[:description])
    if upload.save
      erb :'partials/_show_upload', layout: false, locals: {upload: upload}
    else
      errors = uploads.errors.full_messages
      content_type :json
      errors.to_json
    end
  end
end
