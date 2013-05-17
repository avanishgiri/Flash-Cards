USERS = %w(Ben Avanish Ryan Robert)

4.times { |i| User.create(name: USERS[i], password_hash: 'test')}

10.times { |i| Card.create(question: "Question #{i}", answer: "answer")}


deck = Deck.new(title: "Test-Deck")
deck.cards << Card.all
deck.save
