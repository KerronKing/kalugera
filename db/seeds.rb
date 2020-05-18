# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    password: '123456789'
  )
  news_article = Article.new(
    title: Faker::Lorem.sentence(word_count: 5),
    text: Faker::Lorem.paragraphs(number: 4),
    category: 'news'
  )
  news_article.user = user
  news_article.save!

  business_article = Article.new(
    title: Faker::Lorem.sentence(word_count: 5),
    text: Faker::Lorem.paragraphs(number: 4),
    category: 'business'
  )
  business_article.user = user
  business_article.save!

  ent_article = Article.new(
    title: Faker::Lorem.sentence(word_count: 5),
    text: Faker::Lorem.paragraphs(number: 4),
    category: 'entertainment'
  )
  ent_article.user = user
  ent_article.save!

  tech_article = Article.new(
    title: Faker::Lorem.sentence(word_count: 5),
    text: Faker::Lorem.paragraphs(number: 4),
    category: 'tech'
  )
  tech_article.user = user
  tech_article.save!

  sports_article = Article.new(
    title: Faker::Lorem.sentence(word_count: 5),
    text: Faker::Lorem.paragraphs(number: 4),
    category: 'sports'
  )
  sports_article.user = user
  sports_article.save!

  op_article = Article.new(
    title: Faker::Lorem.sentence(word_count: 5),
    text: Faker::Lorem.paragraphs(number: 4),
    category: 'opinion'
  )
  op_article.user = user
  op_article.save!
end