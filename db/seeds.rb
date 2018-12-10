# add authors to DB
50.times do
  dates = 2.times.map { FFaker::Time.between(200.years.ago, 16.years.ago) }

  author = Author.create(
            first_name: FFaker::Name.first_name,
            last_name: FFaker::Name.last_name,
            biography: FFaker::Book.description,
            birth_date: dates.first,
            death_date: dates.first < dates.last ? dates.last : nil
          )

  2.times { author.images.create!(file: FFaker::Image.file) }
end

#add Books
rand(250..600).times do
  Author.all.sample.books.create!(
    title: FFaker::Book.title,
    description: FFaker::Book.description,
    price: rand(4.99..65.99),
    sold: rand(0..20)
  )
end
