class User < ApplicationRecord

  has_many :tokens, dependent: :destroy
  has_many :devices, dependent: :destroy
  # has_many :entries, through: :entries_users
  has_and_belongs_to_many :entries

  after_create :generate_token
  after_create :assign_random_entry

  def self.find_by_token(token)
    Token.find_by_contents(token).user
  end

  def add_entry_to_diary(entry)
    self.entries << entry
    self.devices.each { |d|
      d.publish_entry(entry)
    }
  end

  def generate_token
    self.tokens.create
  end

  private

  def assign_random_entry
    entries << Entry.order('RANDOM()').first
  end

end