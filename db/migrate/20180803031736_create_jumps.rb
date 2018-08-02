class CreateJumps < ActiveRecord::Migration[5.1]
  def change
    create_table :jumps do |t|
      t.string :username
      t.string :ipa
      t.string :jump_name

      t.integer :deaths
      t.integer :jumps
      t.integer :streak
      t.float :points

      t.timestamps
    end
  end
end
