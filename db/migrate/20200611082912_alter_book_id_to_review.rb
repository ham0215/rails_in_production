class AlterBookIdToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :book_id, :bigint, null: false, after: :user_id

    add_index :reviews, :book_id, name: 'book_id'
  end
end
