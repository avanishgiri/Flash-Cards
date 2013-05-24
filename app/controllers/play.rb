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
      redirect "/"
    end
    return erb :_question
  end

  @resp = "Wrong answer."
  erb :_question, :layout => false
end

