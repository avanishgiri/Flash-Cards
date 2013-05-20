class Subject < ActiveRecord::Base
  # Remember to create a migration!
  has_many :decks
end
