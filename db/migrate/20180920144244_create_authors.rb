class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :biography
      t.date :birth_date
      t.date :death_date

      t.timestamps
    end
  end
end
