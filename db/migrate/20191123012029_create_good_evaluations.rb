class CreateGoodEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :good_evaluations do |t|
      t.integer :good
      t.references :user, foreign_key: true
      t.references :evaluate, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
