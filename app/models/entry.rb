class Entry < ApplicationRecord
  has_and_belongs_to_many :users
  has_one :photo
  # has_many :users, through: :entries_users

  def lat_f
    lat.to_f
  end

  def lng_f
    lng.to_f
  end

  def radius_f
    radius.to_f
  end
end
