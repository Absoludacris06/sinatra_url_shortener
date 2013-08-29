
post '/urls' do
  # create a new Url
  @url = Url.create(webpage: params[:webpage])
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

