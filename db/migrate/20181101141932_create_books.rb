class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.references :author, foreign_key: true
      t.float :price
      t.integer :sold

      t.timestamps
    end
  end
end
