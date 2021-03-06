# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.safe_email,
  password: '123456789'
)
news_article = Article.new(
  title: Faker::Lorem.sentence(word_count: 5),
  text: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true),
  category: 'news'
)
news_article.author = user
news_article.image.attach(
  io: File.open('app/assets/images/news.jpg'),
  filename: 'nw.jpg'
)
news_article.save!

business_article = Article.new(
  title: Faker::Lorem.sentence(word_count: 5),
  text: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true),
  category: 'business'
)
business_article.author = user
business_article.image.attach(
  io: File.open('app/assets/images/business.jpg'),
  filename: 'bus.jpg'
)
business_article.save!

ent_article = Article.new(
  title: Faker::Lorem.sentence(word_count: 5),
  text: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true),
  category: 'entertainment'
)
ent_article.author = user
ent_article.image.attach(
  io: File.open('app/assets/images/entertainment.jpg'),
  filename: 'ent.jpg'
)
ent_article.save!

tech_article = Article.new(
  title: Faker::Lorem.sentence(word_count: 5),
  text: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true),
  category: 'tech'
)
tech_article.author = user
tech_article.image.attach(
  io: File.open('app/assets/images/tech.jpg'),
  filename: 'te.jpg'
)
tech_article.save!

sports_article = Article.new(
  title: Faker::Lorem.sentence(word_count: 5),
  text: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true),
  category: 'sports'
)
sports_article.author = user
sports_article.image.attach(
  io: File.open('app/assets/images/sports.jpg'),
  filename: 'sp.jpg'
)
sports_article.save!

op_article = Article.new(
  title: Faker::Lorem.sentence(word_count: 5),
  text: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true),
  category: 'opinion'
)
op_article.author = user
op_article.image.attach(
  io: File.open('app/assets/images/opinion.jpg'),
  filename: 'op.jpg'
)
op_article.save!
