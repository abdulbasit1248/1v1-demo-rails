class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.datetime :booking_date
      t.datetime :from_time
      t.datetime :to_time
      t.datetime :from_date
      t.datetime :to_date
      t.references :athlete, foreign_key: true
      t.timestamps
    end
  end
end
