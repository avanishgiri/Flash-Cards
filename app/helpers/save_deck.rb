helpers do
  def save_card
    @card = Card.new(question: params[:question], answer: params[:answer])
	@card.save
	@subject = Subject.find_by_name(params[:subject])
	@deck = Deck.find_by_id(session[:new_deck_id])
	@deck.cards << @card
	@deck.save
	@subject.decks << @deck
	@subject.save
	@deck
  end
end