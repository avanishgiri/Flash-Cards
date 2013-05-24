get '/' do
  @decks = Deck.all
  @user = User.find_by_id(session[:id])
  erb :index
end

post '/signup' do
  user = create_user
  session[:id] = user.id
  redirect '/'
end

post '/login' do
  authenticate(params[:email], params[:password])
  redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end


