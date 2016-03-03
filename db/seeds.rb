
require 'json'

entries_file = Rails.root.join('db', 'seeds', 'entries.json')
entries = JSON.parse File.read entries_file
counter = 0
Entry.create!(entries) do |e|
  puts "Created ##{counter += 1} #{e.title}"
end


case Rails.env
when 'development'

end