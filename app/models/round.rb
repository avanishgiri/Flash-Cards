class Round < ActiveRecord::Base
  belongs_to :user, :deck
end
