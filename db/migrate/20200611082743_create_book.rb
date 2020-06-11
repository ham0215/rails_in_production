class CreateBook < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
