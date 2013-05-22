USERS = %w(Ben Avanish Ryan Robert)

4.times { |i| User.create(name: USERS[i], password_hash: 'test')}

10.times { |i| Card.create(question: "Question #{i}", answer: "answer")}
SUBJECTS = %w(Ruby Geography Sports Other)

SUBJECTS.each{|topic| Subject.create(title: topic)}

deck = Deck.new(title: "Test-Deck")
deck.cards << Card.all
deck.save

capitals_deck = Deck.create(title: "US Capitals")

File.open('capitals_raw').each do |line|
  state = line[0..((line =~ /-/)-1)].strip
  capital = line.match(/!.*%/)[0].gsub('%','')
  first_digit = capital =~ /\d/
  capital = capital[0...(first_digit)] if first_digit
  capital = capital.gsub(/!/,'').strip.lstrip
  c = Card.new(question: "What is the capital of #{state}?", 
    answer: "#{capital}")

  c.save
  capitals_deck.cards << c
end

function Person(gender, height){
	this.gender = gender;
	this.height = height;
}

var person1 = new Person('male')

function Person(gender, height){
	this.gender = gender;
	this.height = height;
	this.heigher = 
}


Person.prototype.sayHello=function(){
	console.log("hello")
}

person2 = new Person('female')

person1.sayHello()
person2.sayHello()