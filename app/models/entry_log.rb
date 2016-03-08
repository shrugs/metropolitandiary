class EntryLog < ApplicationRecord
  self.table_name = 'entries_users'

  # Reasons that an entry was assigned to a user, default to 'auto'
  enum reason: { auto: 0, region: 1 }, _prefix: :is

end