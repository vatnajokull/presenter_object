class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :author, foreign_key: true, index: true
      t.text :file

      t.timestamps
    end
  end
end
