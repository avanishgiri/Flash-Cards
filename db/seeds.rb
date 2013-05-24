USERS = %w(Ben Avanish Ryan Robert)

4.times do |i| 

  User.create(    
    name: USERS[i],
    password_hash: 'test', 
    email: 'ben@ben.com'
  )

end

10.times { |i| Card.create(question: "Question #{i}", answer: "answer")}
SUBJECTS = ["Ruby","Skillcrush","Command Line","Other"]

SUBJECTS.each{|topic| Subject.create(name: topic)}

# deck = Deck.new(title: "Test-Deck")
# deck.cards << Card.all
# deck.save

cli_terms = Deck.create(title: "CLI Terms")
ruby_terms = Deck.create(title: "Ruby Terms")
skillcrush = Deck.create(title: "Skillcrush Terms")
other = Deck.create(title: "Other Terms")
# File.open('capitals_raw.txt').each do |line|
#   state = line[0..((line =~ /-/)-1)].strip
#   capital = line.match(/!.*%/)[0].gsub('%','')
#   first_digit = capital =~ /\d/
#   capital = capital[0...(first_digit)] if first_digit
#   capital = capital.gsub(/!/,'').strip.lstrip
#   c = Card.new(question: "What is the capital of #{state}?", 
#     answer: "#{capital}")

#   c.save
#   capitals_deck.cards << c
# end

File.open('cli.csv').each do |line|
  line = line.chomp.split(',')
  card = Card.new(
    question: "How would you do \"#{line[1]}\"", 
    answer: "#{line[0]}"
    )
  card.save
  cli_terms.cards << card
end