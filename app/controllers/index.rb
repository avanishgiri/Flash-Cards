get '/' do
  @decks = Decks.all
  erb :index
end
