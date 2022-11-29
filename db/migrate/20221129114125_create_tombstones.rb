class CreateTombstones < ActiveRecord::Migration[7.0]
  def change
    create_table :tombstones do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.date :death_date
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
