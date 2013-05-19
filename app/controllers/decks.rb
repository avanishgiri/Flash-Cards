post '/create_deck' do
  @deck = Deck.create(title: params[:title])

  session[:new_deck_id] = @deck.id

  redirect '/create_deck'
end

get '/create_deck' do



  erb :create_deck
end

post '/create_card' do
  @card = Card.new(question: params[:question], answer: params[:answer])
  @card.save
  @deck = Deck.find_by_id(session[:new_deck_id])
  @deck.cards << @card
  @deck.save
  redirect '/create_deck'
end
