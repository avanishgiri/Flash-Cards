class User < ActiveRecord::Base
  include BCrypt
  
  validates :email,         :uniqueness => true
  validates :email,         :presence => true
  validates :name,          :presence => true
  validates :password_hash, :presence => true
  
  has_many :rounds
  has_many :decks, :through => :rounds
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
