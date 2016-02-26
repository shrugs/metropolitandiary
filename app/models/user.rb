class User < ApplicationRecord

  has_many :tokens, dependent: :destroy
  has_and_belongs_to_many :entries

  after_create :generate_token
  after_create :assign_random_entry

  def self.find_by_token(token)
    Token.find_by_contents(token).user
  end

  private

  def generate_token
    self.tokens.create
  end

  def assign_random_entry
    entries << Entry.order('RANDOM()').first
  end

end
