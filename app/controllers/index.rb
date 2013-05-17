get '/' do
  session[:id] = 1
  erb :index
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
