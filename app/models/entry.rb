class Entry < ApplicationRecord
  has_and_belongs_to_many :users
  has_one :photo
  # has_many :users, through: :entries_users

end
