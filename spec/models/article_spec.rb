require 'rails_helper'

RSpec.describe Article, type: :model do
  it "create article" do
    a = Article.create!(name: FFaker::Lorem.sentence, content: "Please write article content", published: 't')
    expect(a.reload.published?).to eq(true)
  end
end
