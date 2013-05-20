class Deck < ActiveRecord::Base
  belongs_to :subject
  has_many :cards
  has_many :rounds
  has_many :users, :through => :rounds
end
