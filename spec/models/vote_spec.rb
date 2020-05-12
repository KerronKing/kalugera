require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:user) { 
    User.new(first_name: 'Test', last_name: 'User', email: 'testuser@example.com', password: 'testuser123')
  }

  before(:each) do
    @article = user.articles.build(
      title: 'Test Article',
      text: 'This is some sample content',
      category: 'info'
    )
    @article.save
  end

  it 'should have one user' do
    vote = Vote.reflect_on_association(:user)
    expect(vote.macro).to eq(:belongs_to)
  end

  it 'should have one article' do
    vote = Vote.reflect_on_association(:article)
    expect(vote.macro).to eq(:belongs_to)
  end
end
