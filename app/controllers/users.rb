# which contains the routes related to creating, displaying, and editing users

before '/user/:id' do
  unless logged_in?
    redirect to('/')
  end
end

get '/user/:id' do
  @urls = User.find(params[:id]).urls
  erb :user_page
end

