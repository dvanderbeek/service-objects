class Blog::Post < ApplicationRecord
  validates :title, presence: true
end
