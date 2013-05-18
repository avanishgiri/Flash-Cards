get '/' do
  session[:id] = 1
  erb :index
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
  deck = Deck.find(@round.deck_id)
  index = deck.cards.index(card) + 1
  @card = deck.cards[index]
  p card;
  puts;
  p @card
  if card.answer == params[:answer]
    @resp = "That was correct"
    @round.num_correct += 1;
    return erb :_question#,:layout => false
  end
  @resp = "Wrong answer."
  puts "we got here!"
  erb :_question#, :layout => false
end


