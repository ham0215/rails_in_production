class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :content, default: ''
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
