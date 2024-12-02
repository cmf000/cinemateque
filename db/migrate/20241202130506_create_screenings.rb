class CreateScreenings < ActiveRecord::Migration[8.0]
  def change
    create_table :screenings do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.integer :weekday, null: false
      t.time :start_time, null: false

      t.timestamps
    end
  end
end
