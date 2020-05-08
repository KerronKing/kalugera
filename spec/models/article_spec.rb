require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.new(
    first_name: 'Test',
    last_name: 'User',
    email: 'testuser@example.com',
    password: 'testuser123'
  )}
  
  let(:article) { user.articles.build(
    title: 'Test Article',
    text: 'This is some sample content',
    category: 'info'
  )}

  it 'should have a title present' do
    expect(article).to be_valid
  end

  it 'is invalid if the title is not present' do
    article = Article.new(title: ' ')
    expect(article).to_not be_valid
  end

  it 'is invalid if the text is not present' do
    article = Article.new(text: ' ')
    expect(article).to_not be_valid
  end

  it 'should have one user' do
    article = Article.reflect_on_association(:user)
    expect(article.macro).to eq(:belongs_to)
  end

  it 'should have many votes' do
    article = Article.reflect_on_association(:votes)
    expect(article.macro).to eq(:has_many)
  end
end
