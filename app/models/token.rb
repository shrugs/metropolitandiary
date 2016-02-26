class Token < ApplicationRecord
  belongs_to :user
  before_create :generate_self

  def generate_self
    begin
      self.contents = SecureRandom.hex
    end while self.class.exists?(contents: contents)
  end
end
