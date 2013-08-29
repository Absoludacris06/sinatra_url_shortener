# which contains the routes related to logging in and logging out

get '/login' do 
  erb :login
end

post '/login' do 
  if user = User.authenticate(params[:email], params[:password])
    session[:user_email] = user.email
    session[:user_name] = user.name
    #@urls = user.urls
    redirect to("/user/#{user.id}")
  else
    erb :login_error
  end
end

get '/signup' do 
  @errors = []
  erb :signup
end

post '/signup' do
  @new_user = User.create(params[:post])
  if @new_user.valid?
    session[:user_email] = @new_user.email
    session[:user_name] = @new_user.name
    erb :user_page
  else
    @errors = @new_user.errors.full_messages
    erb :signup
  end
end

post '/logout' do 
  session[:user_email] = nil
  session[:user_name] = nil
  redirect to('/')
end

