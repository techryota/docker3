class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :first1
      t.integer :second1
      t.integer :first2
      t.integer :second2
      t.integer :first3
      t.integer :second3
      t.integer :first4
      t.integer :second4
      t.integer :first5
      t.integer :second5
      t.integer :first6
      t.integer :second6
      t.integer :first7
      t.integer :second7
      t.integer :first8
      t.integer :second8
      t.integer :first9
      t.integer :second9
      t.integer :first10
      t.integer :second10
      t.integer :first11
      t.integer :second11
      t.integer :first12
      t.integer :second12
      t.integer :first_hit
      t.integer :second_hit
      t.integer :first_error
      t.integer :second_error
      t.string :first_team
      t.string :second_team
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
