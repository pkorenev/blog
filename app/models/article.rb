class Article < ActiveRecord::Base
  has_many :comments, as: :commentable

  scope :published, ->{ where(published: 't') }
end
