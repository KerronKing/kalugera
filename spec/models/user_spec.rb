# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(
    first_name: 'Test',
    last_name: 'User',
    email: 'testuser@example.com',
    password: 'testuser123'
  )}

  it 'should have a name present' do
    expect(user).to be_valid
  end

  it 'is invalid if a first name is not present' do
    user = User.new(first_name: ' ')
    expect(user).to_not be_valid
  end

  it 'is invalid if a last name is not present' do
    user = User.new(last_name: ' ')
    expect(user).to_not be_valid
  end

  it 'should have a first name that is less than 16 characters long' do
    user.first_name = 'a' * 16
    expect(user).to_not be_valid
  end

  it 'should have a last name that is less than 16 characters long' do
    user.last_name = 'a' * 16
    expect(user).to_not be_valid
  end

  it 'should have an email present' do
    user = User.new(email: ' ')
    expect(user).to_not be_valid
  end

  it 'should have an email less than 40 characters long' do
    user.email = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@example.com'
    expect(user).to_not be_valid
  end

  it 'should have many articles' do
    user = User.reflect_on_association(:articles)
    expect(user.macro).to eq(:has_many)
  end

  it 'should have many votes' do
    user = User.reflect_on_association(:votes)
    expect(user.macro).to eq(:has_many)
  end
end
