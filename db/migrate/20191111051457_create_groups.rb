class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.index :name
      t.date :date
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
