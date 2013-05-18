USERS = %w(Ben Avanish Ryan Robert)

4.times { |i| User.create(name: USERS[i], password_hash: 'test')}

10.times { |i| Card.create(question: "Question #{i}", answer: "answer")}


deck = Deck.new(title: "Test-Deck")
deck.cards << Card.all
deck.save

capitals_deck = Deck.create(title: "US Capitals")

File.open('../capitals').each do |line|
  line = line.chomp.split('-')
  c = Card.new(question: "What is the capital of #{line[0].strip}?", 
    answer: "#{line[1].lstrip}")
  c.save
  capitals_deck.cards << c
end
