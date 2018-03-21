require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "add comment to article" do
    article = Article.find(1)
    user = User.find(1)
    comment_text = FFaker::Lorem.sentences(3)
    old_comments_count = article.comments.count
    article.comments.create!(commentable: article, user_id: user.id, comment_text: comment_text)
    expect(article.comments.count).to eq(old_comments_count + 1)
  end

  it "add blank comment to article should not be created" do
    article = Article.find(1)
    user = User.find(1)
    comment_text = ""
    old_comments_count = article.comments.count
    article.comments.create(commentable: article, user_id: user.id, comment_text: comment_text)
    expect(article.comments.count).to eq(old_comments_count)
  end
end
