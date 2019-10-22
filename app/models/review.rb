class Review < ApplicationRecord
  belongs_to :user

  enum status: {
    draft: 0,
    published: 1,
    deleted: 9,
  }
end
