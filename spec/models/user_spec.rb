require 'rails_helper'

RSpec.describe User, type: :model do
  it "create user" do
    email = "#{FFaker::Lorem.words(2).join('_')}@gmail.com"
    password = "#{FFaker::Lorem.characters(12)}"
    u = User.create!(email: email, password: password, password_confirmation: password)
    expect(u.persisted?).to eq(true)
  end
end
