get '/' do
  p "NOW IN HOME"
  p session[:user_id]
  @decks = Deck.all
  @user = User.where('id = ?',session[:user_id]).to_a[0]
  p @user
  erb :index
end

post '/signup' do
  @user = create_user
  p @user
  session[:id] = @user.id
  redirect '/'
end

post '/login' do
  authenticate(params[:email], params[:password])
  p session[:user_id]
  redirect '/'
end

post '/play/:deck_id' do
  Round.create(deck_id: params[:deck_id], user_id: session[:id])
  redirect "/play/#{params[:deck_id]}"
end

get '/play/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @round = Round.find_by_deck_id(@deck.id)
  erb :play
end

get '/logout' do
  session.clear
  redirect '/'
end
