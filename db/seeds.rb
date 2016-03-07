
require 'json'

entries_file = Rails.root.join('db', 'seeds', 'entries.json')
entries = JSON.parse File.read entries_file

entries.each_with_index do |e, i|

  if e.has_key? 'photo'
    photo = Photo.new e['photo']
    e.delete 'photo'
    e['photo'] = photo
  end
  e = Entry.create!(e)

  puts "Created ##{e.id}: #{e.title}"
end


case Rails.env
when 'development'

end