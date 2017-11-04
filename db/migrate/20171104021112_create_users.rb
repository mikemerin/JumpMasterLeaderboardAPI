class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :runs
      t.integer :jumps
      t.integer :deaths
      t.integer :longest
      t.string :bestjump_type
      t.float :bestjump_points
      t.float :easy
      t.float :medium
      t.float :hard
      t.float :hardest
      t.float :sum

      t.timestamps
    end
  end
end
