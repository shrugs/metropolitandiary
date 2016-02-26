

case Rails.env
when 'development'

  20.times.map {
    Api::V1::Entry.create({
      title: Faker::Book.title,
      author: Faker::Book.author,
      content: Faker::Lorem.paragraphs(1 + Random.rand(3)),
      permalink: Faker::Internet.url,
      date_published: Faker::Time.between(DateTime.now - 2.years, DateTime.now - 1.days)
    })
  }

end