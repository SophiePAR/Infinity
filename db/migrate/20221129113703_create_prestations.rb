class CreatePrestations < ActiveRecord::Migration[7.0]
  def change
    create_table :prestations do |t|
      t.string :title
      t.integer :price
      t.string :content

      t.timestamps
    end
  end
end
