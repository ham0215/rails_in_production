class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum status: {
    draft: 0,
    published: 1,
    deleted: 9,
  }
end
