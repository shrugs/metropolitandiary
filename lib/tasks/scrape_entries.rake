
desc 'Scrape the Entries from the NYT'
task :scrape_entries do
  urls = JSON.parse File.read Rails.root.join('db', 'seeds', 'top_urls.json')

  entries = urls.map do |url, i|

    html = HTTParty.get url
    doc = Nokogiri::HTML(html)

    img = doc.css('[itemprop="associatedMedia"]').first.andand.css('img').andand.first

    entry = {
      title: doc.css('[itemprop="headline"]').text,
      content: doc.css('[itemprop="articleBody"]').map(&:text).map(&:strip).join("\n\n"),
      author: doc.css('.simple-byline-author').text,
      permalink: url,
      date_published: DateTime.strptime(doc.css('meta[itemprop="datePublished"]').attr('content').value, '%s')
    }

    unless img.nil?
      entry[:photo] = {
        url: img.attr('src'),
        caption: img.attr('data-mediaviewer-caption'),
        attribution: img.attr('data-mediaviewer-credit'),
      }
    end

    entry
  end

  File.open(Rails.root.join('db', 'seeds', 'entries.json'), 'w') do |f|
    f.write entries.to_json
  end

end