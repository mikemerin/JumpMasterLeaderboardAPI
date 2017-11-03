class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.string :username
      t.string :points
      t.string :easy
      t.string :medium
      t.string :hard
      t.string :hardest
      t.string :jumps
      t.string :deaths

      t.timestamps
    end
  end
end
