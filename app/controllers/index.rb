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
 
  redirect '/'
end

post '/login' do
  authenticate(params[:email], params[:password])
  redirect '/'
end

post '/play/:deck_id' do
  redirect "/play/#{params[:deck_id]}"
end

get '/play/:deck_id' do  ### at this point we have params[:deck_id]
  @round = Round.create(deck_id: params[:deck_id], user_id: session[:user_id], num_correct: 0)
  deck = Deck.find(params[:deck_id])
  # @round = Round.find_by_deck_id(@deck.id)
  @card = deck.cards.first
  erb :_question
end

post '/answer' do
  card = Card.find(params[:card_id])
  @round = Round.find(params[:round_id])

  deck = Deck.find(@round.deck_id)
  index = deck.cards.index(card) + 1
  @card = deck.cards[index]

  if card.answer == params[:answer]
    @resp = "That was correct"
    @round.num_correct += 1;
    p "Incrementing count"
    @round.save
    unless @card
      return "hello"
    end
    return erb :_question,:layout => false
  end

  @resp = "Wrong answer."
  erb :_question, :layout => false
end


get '/logout' do
  session.clear
  redirect '/'
end


