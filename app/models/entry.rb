class Entry < ApplicationRecord
  acts_as_mappable
  has_and_belongs_to_many :users
  # has_many :users, through: :entries_users

end
