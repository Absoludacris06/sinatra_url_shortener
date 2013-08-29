
post '/urls' do
  # create a new Url
  user_id = nil
  if logged_in?
    user_id = @current_user.id
  end
  @url = Url.create(webpage: params[:webpage], user_id: user_id)
  erb :create
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  @url = Url.find_by_key(params[:short_url])
  puts @url
  @url.click_count += 1
  @url.save
  redirect to("#{@url.webpage}")
end


