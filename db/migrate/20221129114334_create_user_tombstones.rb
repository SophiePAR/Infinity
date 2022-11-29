class CreateUserTombstones < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tombstones do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tombstone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
