get '/' do
  # let user create new short URL, display a list of shortened URLs
  @urls = Url.order("created_at DESC").where(user_id: nil)
  erb :index
end




