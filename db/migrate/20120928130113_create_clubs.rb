class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :description
      t.integer :user_id

      t.timestamps
    end
    add_index :clubs, [:user_id, :created_at]
  end
end
