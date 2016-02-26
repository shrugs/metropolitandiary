class Token < ApplicationRecord
  before_create :generate_self

  def generate_self
    self.contents = SecureRandom.uuid
  end
end
