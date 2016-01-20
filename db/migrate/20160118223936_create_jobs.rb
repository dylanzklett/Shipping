class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :start
      t.string :end
      t.string :name
      t.decimal :cost
      t.string :cargo_description

      t.references :user, index: true, foreign_key: true
      t.references :boat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
