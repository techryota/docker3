class CreateCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :counts do |t|
      t.integer :ball1
      t.integer :ball2
      t.integer :ball3
      t.integer :ball4
      t.integer :strike1
      t.integer :strike2
      t.integer :strike3
      t.integer :auto1
      t.integer :auto2
      t.integer :auto3
      t.string :report
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
