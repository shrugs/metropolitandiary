class User < ApplicationRecord

  has_many :tokens, dependent: :destroy
  has_many :devices, dependent: :destroy
  has_many :entry_logs
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

  def other_entries
    # this is probably terribly inefficient
    Entry.where('id NOT IN (?)', entries.map(&:id))
  end

  def random_other_entry
    other_entries.order('RANDOM()').first
  end

  def generate_token
    self.tokens.create
  end

  def todays_entry_logs
    beginning_of_my_day = ActiveSupport::TimeZone.new(timezone).now.beginning_of_day.utc
    entry_logs.where('created_at >= ?', beginning_of_my_day)
  end

  private

  def assign_random_entry
    entries << Entry.order('RANDOM()').first
  end

end