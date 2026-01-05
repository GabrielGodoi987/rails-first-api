class CreateAuthors < ActiveRecord::Migration[8.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.date :birth

      t.timestamps
    end
  end
end
