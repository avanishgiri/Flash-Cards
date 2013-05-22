get '/' do
  p "NOW IN HOME"
  @decks = Deck.all
  @user = User.where('id = ?',session[:user_id]).to_a[0]
  erb :index
end

post '/signup' do
  @user = create_user
  session[:id] = @user.id
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


