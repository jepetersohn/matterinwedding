get '/users/new' do
	if request.xhr?
  		erb :'partials/_new_user', layout: false
  	end
end

post '/users' do
  if request.xhr?
	  user = User.new(params[:user])
	  if user.save
	    status 200
	  end
	end
end
