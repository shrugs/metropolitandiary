class User < ApplicationRecord

  has_many :tokens, dependent: :destroy

  after_create :generate_token

  def generate_token
    self.tokens.create
  end

end
