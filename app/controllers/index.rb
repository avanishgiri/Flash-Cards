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

get '/play/:deck_id' do  ### at this point we have params[:deck_id]
  @deck = Deck.find(params[:deck_id])
  @round = Round.find_by_deck_id(@deck.id)
  @card = @deck.cards.first
  erb :_question
end

post '/answer' do
  p params; puts; puts;
  card = Card.find(params[:card_id])
  @round = Round.find(params[:round_id])
  p @round.num_correct
  p "---------"
  deck = Deck.find(@round.deck_id)
  index = deck.cards.index(card) + 1
  @card = deck.cards[index]
  p card;
  puts;
  p @card
  unless @card
    p "hello"
    return "hello"
  end
    p @round.num_correct
  if card.answer == params[:answer]
    p "correct"
    @resp = "That was correct"
    @round.num_correct += 1;
    p @round.num_correct
    @round.save
    return erb :_question,:layout => false
  end
  @resp = "Wrong answer."
  puts "we got here!"
  erb :_question, :layout => false
end


get '/logout' do
  session.clear
  redirect '/'
end

